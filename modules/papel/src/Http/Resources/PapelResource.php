<?php

namespace Modules\Papel\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Papel\Models\Papel;
use Modules\Papel\Models\Permissao;
use Modules\Papel\Http\Resources\PermissaoCollection;

class PapelResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

     protected function getPermissoes() :array{
        $lista = [];
        $papel = Papel::where('id', $this->id)->with('permissao')->first();

        foreach($papel->permissao as $permissao){
            $lista[]=$permissao->nome;
        }
        return $lista;
     }
    public function toArray(Request $request): array
    {
        $permissoes = PapelResource::getPermissoes();
        return [
            'id' => $this->id,
            'nome' =>$this->nome,
            'descricao' => $this->descricao,
            'permissoes'=>$permissoes
        ];
    }
}
