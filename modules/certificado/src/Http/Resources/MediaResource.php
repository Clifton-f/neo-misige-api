<?php

namespace Modules\Certificado\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class MediaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        $cadeira = DB::table('cadeiras')->where('id',$this->cadeira_id)
            ->first()->nome;

        return [
            'cadeira'=>$cadeira,
            'media'=>$this->media
        ];

    }
}
