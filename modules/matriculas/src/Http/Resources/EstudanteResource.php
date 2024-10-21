<?php

namespace Modules\Matriculas\Http\Resources;


use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Matriculas\Models\User;

class EstudanteResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'dadosPessoais'=>new UserResource(User::where('id',$this->id)->first()),
        
            'dadosMatricula'=>[
                
                'numeroEstudante'=>$this->numero_estudante,
                'cursoId'=>$this->curso_id,
                'dataEntrada'=>$this->data_entrada
            ]
        ];
    }
}
