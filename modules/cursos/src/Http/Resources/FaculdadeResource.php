<?php

namespace Modules\Cursos\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Cursos\Models\User;

class FaculdadeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = User::where('id',$this->director)->first();
        return [
            'id'=>$this->id,
            'nome'=>$this->nome,
            'director'=>[
                'id'=>$user->id,
                'nome'=>$user->nome,
            ]

        ];
    }
}
