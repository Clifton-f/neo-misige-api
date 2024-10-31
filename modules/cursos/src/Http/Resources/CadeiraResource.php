<?php

namespace Modules\Cursos\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Cursos\Models\Departamento;

class CadeiraResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $departamento = Departamento::where('id',$this->departamento_id)->first();
        return [
            "id"=>$this->id,
            "nome"=>$this->nome,
            //"descricao"=>$this->descricao,
            "departamento"=>[
                "id"=>$departamento->id,
                'nome'=>$departamento->nome,
            ]
        ];
    }
}
