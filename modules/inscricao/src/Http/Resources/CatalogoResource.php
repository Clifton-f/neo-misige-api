<?php

namespace Modules\Inscricao\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Inscricao\Models\Cadeira;

class CatalogoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $cadeira=Cadeira::where('id',$this->cadeira_id)->first();
        return [
            'cadeira'=>[
                "id"=>$cadeira->id,
                'nome'=>$cadeira->nome,
                "semestre"=>$this->semestre,

            ],
        ];
    }
}
