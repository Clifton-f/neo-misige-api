<?php

namespace Modules\Avaliacoes\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;
use Modules\Avaliacoes\Models\Curso;
use Modules\Docente\Models\Cadeira;

class AvaliacaoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $curso=Curso::where('id',$this->curso_id)->first();
        $cadeira=Cadeira::where('id',$this->cadeira_id)->first();
        $notas = DB::table('avaliacao_nota')
            ->join('estudantes','estudantes.id','=','avaliacao_nota.estudante_id')
            ->join('users','users.id','=','avaliacao_nota.estudante_id')
            ->select('users.nome as nome','estudantes.numero_estudante as numeroEstudante','avaliacao_nota.nota as nota')
            ->where('avaliacao_nota.curso_id',$this->curso_id)->where('avaliacao_nota.cadeira_id',$this->cadeira_id)
            ->where('avaliacao_nota.ano',$this->ano)
            ->get();
        return [
            "curso"=>[
                'id'=>$curso->id,
                'nome'=>$curso->nome],
            "cadeira"=>[
                'id'=>$cadeira->id,
                'nome'=>$cadeira->nome
            ],
            'nomeAvaliacao'=>$this->nome_avaliacao,
            'peso'=>$this->peso*100,
            "notas"=>$notas
        ];
    }
}
