<?php

namespace Modules\Turma\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class TurmaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $curso = DB::table('cursos')->where('id',$this->curso_id)->first();
        $cadeira = DB::table('cadeiras')->where('id',$this->cadeira_id)->first();
        $medias = DB::table('medias')->where('curso_id',$this->curso_id)
            ->where('cadeira_id',$this->cadeira_id)->where('ano',$this->ano)->get();
        $avaliacoes = DB::table('avaliacoes')->where('curso_id',$this->curso_id)
            ->where('cadeira_id',$this->cadeira_id)->where('ano',$this->ano)->get();
        $pauta = [];
        foreach ($medias as $media){
            $dadosEstudante = DB::table('estudantes')->where('id',$media->estudante_id)->first();
            $avaliacoes = DB::table('avaliacao_nota')->select('nome_avaliacao','nota')
                ->where('estudante_id',$dadosEstudante->id)
                    ->where('curso_id',$this->curso_id)
                    ->where('cadeira_id',$this->cadeira_id)->where('ano',$this->ano)->get();
            $estudante= [
                "numeroEstudante"=>$dadosEstudante->numero_estudante,
                "nome"=>$dadosEstudante->nome,
                "avaliacoes"=>$avaliacoes,
                "media"=>$media->media

            ];
            $pauta[]=$estudante;
    }
        return [
            "dadosTurma" => [
                'curso' => [
                    'id'=>$curso->id,
                    "nome" => $curso->nome,
                ],
                'cadeira'=>[
                    'id'=>$cadeira->id,
                    'nome'=>$cadeira->nome

                ],
                "ano"=>$this->ano,
            ],
            "pauta"=>$pauta
        ];
        return parent::toArray($request);
    }
}
