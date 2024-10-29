<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

use Modules\Docente\Models\Docente;
use Modules\Docente\Models\Cadeira;
use Modules\Docente\Models\Curso;
use Modules\Docente\Models\Nota;
use Modules\Docente\Models\Estudante;
//use Modules\Docente\Http\Resources\NotaResources;

class NotaCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        $cadeira = [];
        $curso = [];
        $estudante_frequencia = [];


        foreach($this as $index => $row){

            //$cadeira = Cadeira::select('id', 'nome')->where('id', $row->cadeira_id)->first();
            //$curso = Curso::select('id', 'nome')->where('id', $row->curso_id)->first();
            /*$estudante_frequencia = Estudante::select('nome_avaliacao','nota','estudantes.id as id', 'numero_estudante', 'nome')
                                    ->join('avaliacao_nota', 'estudante_id', 'estudantes.id')
                                    ->where('nome_avaliacao', $row->nome_avaliacao)
                                    ->join('users', 'users.id', 'estudantes.id')
                                    ->get();*/
            $estudante_frequencia = Estudante::select('estudantes.id as id', 'numero_estudante', 'nome','nota')
                                    ->join('avaliacao_nota', 'estudante_id', 'estudantes.id')
                                    ->where('nome_avaliacao', $row->nome_avaliacao)
                                    ->join('users', 'users.id', 'estudantes.id')
                                    ->get();
            break;
        }

        return [
            //'cadeira' => $cadeira,
            //'curso' => $curso,
            'notas' => $estudante_frequencia
        ];
    }

}
