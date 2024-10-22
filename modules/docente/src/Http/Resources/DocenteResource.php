<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Docente\Models\User;
use Modules\Docente\Models\Docente;
use Modules\Docente\Models\Turma;

class DocenteResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

    
    public function toArray(Request $request): array
    {
        $user = User::where('id', $this->id)->first();
        $turmas = Turma::where('docente_id',$this->id)->get();
        
        return [
            'dadosPessoais'=>[
            'id'=>$user->id,
            'nome'=>$user->nome,
            'email'=>$user->email,
            'BI'=>$user->BI,
            'NUIT'=>$user->NUIT,
            'contacto'=>[$user->contacto_1,$user->contacto_1],

            ],
            "turmas"=>new TurmaCollection($turmas)
            
            
        ];
    }
}
