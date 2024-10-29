<?php

namespace Modules\Inscricao\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Inscricao\Models\Cadeira;
use Modules\Inscricao\Models\Estudante;
use Modules\Inscricao\Models\User;

class MediaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = User::where('id',$this->estudante_id)->first();
        $estudante=Estudante::where('id',$user->id)->first();
        $cadeira = Cadeira::where('id',$this->cadeira_id)->first();
        return [
            'id'=>$user->id,
            'nome'=>$user->nome,
            'numeroEstudante'=>$estudante->numero_estudante,
            $cadeira->nome,
        ];
    }
}
