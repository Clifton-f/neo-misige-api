<?php

namespace Modules\Cursos\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class DepartamentoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $faculdade = DB::table('faculdades')->where('id',$this->faculdade_id)
            ->first();
        return [
            "id"=>$this->id,
            "nome"=>$this->nome,
            "descricao"=>$this->descricao,
            "faculdade"=>[
                "id"=>$faculdade->id,
                "nome"=>$faculdade->nome,
            ]
        ];
    }
}
