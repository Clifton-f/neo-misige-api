<?php

namespace Modules\Inscricao\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Inscricao\Models\Curso;
use Modules\Inscricao\Models\User;

class EstudanteResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user=User::where('id',$this->id)->first();
        return [
            "id"=>$this->id,
            "numeroEstudante"=>$this->numeroEstudante,
            "nome"=>$user->nome,
            "curso"=>Curso::where("id",$user->curso_id)->first()->nome,

        ];

    }
}
