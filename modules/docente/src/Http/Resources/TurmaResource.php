<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;


use Modules\Docente\Models\Cadeira;

use Modules\Docente\Models\Curso;
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
        /*$cadeira = Cadeira::where('id', $this->cadeira_id)->first();
     //$regente = Docente::where('id', $this->regente_id)->with(User::class)->first();
     $curso = Curso::where('id', $this->curso_id)->first();

     $estudantes = DB::table('estudantes')->join('users', 'estudantes.id', '=', 'users.id')
     ->join('medias', 'estudantes.id', '=', 'medias.estudante_id')
     ->select('users.id', 'users.nome','estudantes.numero_estudante')
     ->where('medias.curso_id', $this->curso_id)
     ->where('medias.cadeira_id', $this->cadeira_id)
     ->where('medias.ano', $this->ano)->get();

         return [
            'cadeira'=>[
                'cadeiraId' => $cadeira->id,
                'cadeiraNome' => $cadeira->nome,
            ],
            'curso'=>[
            'cursoId' => $curso->id,
            'cursoNome' => $curso->nome,
            ],
            'ano'=>$this->ano,
         ];

    }

    public function getTurma(){

        $cadeira = Cadeira::where('id', $this->cadeira_id)->first();
     $//regente = Docente::where('id', $this->regente_id)->with(User::class)->first();
     $curso = Curso::where('id', $this->curso_id)->first();

     $estudantes = DB::table('estudantes')->join('users', 'estudantes.id', '=', 'users.id')
     ->join('medias', 'estudantes.id', '=', 'medias.estudante_id')
     ->select('users.id', 'users.nome','estudantes.numero_estudante')
     ->where('medias.curso_id', $this->curso_id)
     ->where('medias.cadeira_id', $this->cadeira_id)
     ->where('medias.ano', $this->ano)->get();

         return [
            'cadeira'=>[
                'cadeiraId' => $cadeira->id,
                'cadeiraNome' => $cadeira->nome,
            ],
            'curso'=>[
            'cursoId' => $curso->id,
            'cursoNome' => $curso->nome,
            ],


            'regenteId' => $regente?->id,
            'regenteNome' => $regente?->nome,
            'estudantes' => $estudantes,
         ];
     */




        $curso = DB::table('cursos')->where('id',$this->curso_id)->first();
        $cadeira = DB::table('cadeiras')->where('id',$this->cadeira_id)->first();
        $medias = DB::table('medias')->where('curso_id',$this->curso_id)
            ->where('cadeira_id',$this->cadeira_id)->where('ano',$this->ano)->get();
        $avaliacoes = DB::table('avaliacoes')->where('curso_id',$this->curso_id)
            ->where('cadeira_id',$this->cadeira_id)->where('ano',$this->ano)->get();
        $pauta = [];
        foreach ($medias as $media){
            $dadosEstudante = DB::table('estudantes')
                ->join("users", "users.id",'=',"estudantes.id")
                ->where('users.id',$media->estudante_id)->first();
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
