<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Modules\Docente\Models\Turma;
use Modules\Docente\Models\Docente;
use Modules\Docente\Models\Cadeira;
use Modules\Docente\Models\Curso;
use Illuminate\Support\Facades\DB;


class TurmaCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        $result = [];
        foreach($this as $index => $row){
            $cadeira = Cadeira::where('id', $row->cadeira_id)->first();
            $regente = Docente::where('id', $row->regente_id)->with(User::class)->first();
            $curso = Curso::where('id', $row->curso_id)->first();      

            $estudantes = DB::table('estudantes')->join('users', 'estudantes.id', '=', 'users.id')
            ->join('medias', 'estudantes.id', '=', 'medias.estudante_id')
            ->select('users.id', 'users.nome','estudantes.numero_estudante')
            ->where('medias.curso_id', $row->curso_id)
            ->where('medias.cadeira_id', $row->cadeira_id)
            ->where('medias.ano', $row->ano)->get();
            array_push($result, [
                    'cadeiraId' => $cadeira->id,
                    'cadeiraNome' => $cadeira->nome,
                    'cursoId' => $curso->id,
                    'cursoNome' => $curso->nome,
                    'ano' => $row->ano,
                    'regenteId' => $regente?->id,    
                    'regenteNome' => $regente?->nome,
                    'estudantes' => $estudantes,
                ]
            );

        }
   
        return $result;
    }
}
