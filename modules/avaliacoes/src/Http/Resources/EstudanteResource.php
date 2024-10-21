<?php

namespace Modules\Avaliacoes\Http\Resources;

use Modules\Avaliacoes\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;


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
        return [
            'id'=>$this->id,
            'numeroEstudante'=>$this->numero_estudante,
            'dadosPessoais'=>[
            'id'=>$user->id,
            'nome'=>$user->nome,
            'email'=>$user->email,
            'BI'=>$user->BI,
            'NUIT'=>$user->NUIT,
            'contacto'=>[$user->contacto_1,$user->contacto_1],

            ]
            //'nome'=>$user->nome,
            
        ];
    }
}
