<?php

namespace Modules\Certificado\Http\Resources;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;
use Modules\Certificado\Models\User;

class EstudanteResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = User::where('id',$this->id)->first();
        $cadeiras = DB::table('medias')
            ->join('cadeiras', 'medias.cadeira_id', '=', 'cadeiras.id')
            ->select('cadeiras.nome as cadeira','medias.media as media')
            ->where('medias.estudante_id',$this->id);
        //$faculdadde = DB::table('faculdades');
        $curso = DB::table('cursos')
            ->join('departamentos', 'departamentos.id', '=', 'cursos.departamento_id')
            ->join('faculdades', 'faculdades.id', '=', 'departamentos.faculdade_id')
            ->select('cursos.nome as curso','faculdades.nome as faculdade')
            ->where('cursos.id', $this->curso_id)->first();
        $medias = DB::table('medias')->where('estudante_id',$this->id)
            ->where('estado_id',1)->orWhere('estado_id',5)->get();
        $mediaGlobal = 0;

        foreach ($medias as $media) {
            $mediaGlobal+=$media->media;
        }
        if(count($medias)!=0){
            $mediaGlobal = $mediaGlobal/count($medias);
        }
        return [

            'numerEstudante'=>$this->numero_estudante,
            'nome'=>$user->nome,
            'BI'=>$user->BI,
            'faculdade'=>$curso->faculdade,
            'curso'=>$curso->curso,//$this->curso_id,
            'dataInicio'=>$this->data_entrada,
            'dataFim'=>$this->data_saida,
            //'curso_faculdade'=>$curso,
            'mediasCadeiras'=>new MediaCollection($medias),
            'mediaGlobal'=>$mediaGlobal,
            'nomeReitor'=>'Dr. Manuel Guilherme Júnior',

        ];
        return parent::toArray($request);
    }
}
