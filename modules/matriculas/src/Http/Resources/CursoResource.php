<?php

namespace Modules\Matriculas\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Arr;
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
        return [
            'id'=>$this->id,
            'nome'=>$this->nome,
            'descricao'=>$this->descricao,
            'duracaoMinima'=>$this->duracao_minima,
            'duracaoMaxima'=>$this->duracao_maxima
            
        ];
    }
    public function cursoByID():array{
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
