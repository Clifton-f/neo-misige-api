<?php

namespace Modules\Cursos\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;
use Modules\Cursos\Models\Departamento;
use Modules\Cursos\Http\Resources\CatalogoCollection;
use Modules\Cursos\Models\Catalogo;

class CursoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $faculdade = DB::table('departamentos')
            ->join('faculdades', 'faculdades.id', '=', 'departamentos.faculdade_id')
            ->where('departamentos.id',$this->departamento_id)
            ->pluck('faculdades.nome')->toArray();
        $departamento= Departamento::where('id',$this->departamento_id)->first();
        return [
            'id'=>$this->id,
            'nome'=>$this->nome,
            'duracaoMinima'=>$this->duracao_minima,
            'duracaoMaxima'=>$this->duracao_maxima,
            'faculdade'=>$faculdade[0],
            'departamento'=>[
                'id'=>$departamento->id,
                'nome'=>$departamento->nome,
            ],

        ];
    }
    public function getCurso():array{
        $catalogo = Catalogo::where('curso_id',3)->get();
        return[
            'id'=>$this->id,
            'nome'=>$this->nome,
            'descricao'=>$this->descricao,
            'duracaoMinima'=>$this->duracao_minima,
            'duracaoMaxima'=>$this->duracao_maxima,
            'cadeiras'=>new CatalogoCollection($catalogo)
        ];
    }

}
