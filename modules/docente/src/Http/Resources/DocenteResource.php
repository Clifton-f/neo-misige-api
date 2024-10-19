<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Docente\Models\User;
use Modules\Docente\Models\Docente;

class DocenteResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

    
    public function toArray(Request $request): array
    {
        $user = User::where('id', $this->id)->get();
        $docente = Docente::where('id', $this->id)->get();
        return [
            $user,
            $docente
        ];
    }
}
