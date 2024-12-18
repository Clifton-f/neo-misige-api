<?php

namespace Modules\Matriculas\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Modules\Matriculas\Models\Catalogo;

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
        return [
            'id'=>$this->id,
            'nome'=>$this->nome,
            'descricao'=>$this->descricao,
            'faculdade'=>$faculdade[0],
            'duracaoMinima'=>$this->duracao_minima,
            'duracaoMaxima'=>$this->duracao_maxima

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
