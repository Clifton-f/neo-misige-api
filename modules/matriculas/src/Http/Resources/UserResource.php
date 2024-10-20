<?php

namespace Modules\Matriculas\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Matriculas\Models\Papel;

class UserResource extends JsonResource
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
            'email'=>$this->email,
            'BI'=>$this->BI,
            'NUIT'=>$this->NUIT,
            'contacto'=>[$this->contacto_1,$this->contacto_1],

            
            
        ];
    }
}
