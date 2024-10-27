<?php

namespace Modules\Auth\Http\Resources;


use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Modules\Auth\Http\Resources\PapelResource;
use Modules\Auth\Http\Resources\PermissaoResource;
use Modules\Auth\Models\Papel;
use Modules\Auth\Models\Permissao;
use Modules\Auth\Models\User;
use Modules\Auth\Http\Resources\PapelCollection;
use Modules\Auth\Models\UserPapel;
use Modules\Papel\Http\Resources\PermissaoCollection;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */


    public function toArray(Request $request):array
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

    public function getUser():array{


        $papeis = DB::table('user_papel')
            ->join('papeis', 'user_papel.papel_id', '=', 'papeis.id')
            ->where('user_papel.user_id', $this->id)
            ->pluck('papeis.nome')
            ->toArray();

        $permissoes = DB::table('papel_permissao')
            ->join('permissoes', 'papel_permissao.permissao_id', '=', 'permissoes.id')
            ->join('user_papel', 'papel_permissao.papel_id', '=', 'user_papel.papel_id')
            ->where('user_papel.user_id', $this->id)
            ->distinct()
            ->pluck('permissoes.nome')
            ->toArray();

        return [
            'papeis' => $papeis,
            'permissoes' => $permissoes,
        ];
        return[
            'dadosPessoais'=>[
                'id'=>$this->id,
                'nome'=>$this->nome,
                'email'=>$this->email,
                'BI'=>$this->BI,
                'NUIT'=>$this->NUIT,
                'contacto'=>[$this->contacto_1,$this->contacto_1],

                ],
                'papeis' => $papeis,
                'permissao'=>$permissoes,

        ];
    }
}
