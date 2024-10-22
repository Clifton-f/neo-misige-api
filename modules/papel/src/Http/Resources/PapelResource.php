<?php

namespace Modules\Papel\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Papel\Models\Papel;
use Modules\Papel\Models\Permissao;
use Modules\Papel\Http\Resources\PermissaoCollection;
use Modules\Papel\Models\PapelPermissao;

class PapelResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

     
    public function toArray(Request $request): array
    {
        $lista = [];
        $permissoes = PapelPermissao::where('papel_id', $this->id)->with('permissao')->get();

        
        foreach($permissoes as $uniao){
            
            $lista[]=$uniao->permissao->nome;
        }
        
        
        return [
            'id' => $this->id,
            'nome' =>$this->nome,
            'descricao' => $this->descricao,
            'permissoes'=>$lista
        ];
    }
}
