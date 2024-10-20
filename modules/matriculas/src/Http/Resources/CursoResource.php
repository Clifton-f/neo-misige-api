<?php

namespace Modules\Matriculas\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Arr;

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
        return[
            'id'=>$this->id,
            'nome'=>$this->nome,
            'descricao'=>$this->descricao,
            'duracaoMinima'=>$this->duracao_minima,
            'duracaoMaxima'=>$this->duracao_maxima
        ];
    }
}
