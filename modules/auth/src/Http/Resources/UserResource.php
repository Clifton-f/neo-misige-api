<?php

namespace Modules\Auth\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Auth\Http\Resources\PapelResource;
use Modules\Auth\Http\Resources\PermissaoResource;
use Modules\Auth\Models\Papel;
use Modules\Auth\Models\Permissao;
use Modules\Auth\Models\User;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function getPermissoes() :array{
        $lista = [];
        $papel = Papel::where('id', $this->papel_id)->with('permissao')->first();

        foreach($papel->permissao as $permissao){
            
            $lista[]=$permissao->nome;
        }
        return $lista;
     }

    public function toArray(Request $request): array
    {
        return [
            'dadosPessoais'=>[
            'id'=>$this->id,
            'nome'=>$this->nome,
            'email'=>$this->email,
            'BI'=>$this->BI,
            'NUIT'=>$this->NUIT,
            'contacto'=>[$this->contacto_1,$this->contacto_1],

            ],
            'papel' => new PapelResource(Papel::where('id',$this->papel_id)->first()),
            'permissoes'=> UserResource::getPermissoes(User::where('id',$this->id)->first())//Papel::where('id', $this->papel_id)->with('permissao')->first()UserResource::getPermissoes()

        ];
        
    }
}
