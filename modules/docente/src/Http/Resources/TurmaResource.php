<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Docente\Models\Turma;
use Modules\Docente\Models\Docente;
use Modules\Docente\Models\Cadeira;
use Modules\Docente\Models\User;
use Modules\Docente\Models\Curso;
use Illuminate\Support\Facades\DB;


class TurmaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
   

    public function toArray(Request $request): array
    {
        $cadeira = Cadeira::where('id', $this->cadeira_id)->first();
     $regente = Docente::where('id', $this->regente_id)->with(User::class)->first();
     $curso = Curso::where('id', $this->curso_id)->first();      

     $estudantes = DB::table('estudantes')->join('users', 'estudantes.id', '=', 'users.id')
     ->join('medias', 'estudantes.id', '=', 'medias.estudante_id')
     ->select('users.id', 'users.nome','estudantes.numero_estudante')
     ->where('medias.curso_id', $this->curso_id)
     ->where('medias.cadeira_id', $this->cadeira_id)
     ->where('medias.ano', $this->ano)->get();
        
         return [
            'cadeira'=>[
                'cadeiraId' => $cadeira->id,
                'cadeiraNome' => $cadeira->nome,
            ],
            'curso'=>[
            'cursoId' => $curso->id,
            'cursoNome' => $curso->nome,
            ],
         ];

    }

    public function getTurma(){
        
        $cadeira = Cadeira::where('id', $this->cadeira_id)->first();
     $regente = Docente::where('id', $this->regente_id)->with(User::class)->first();
     $curso = Curso::where('id', $this->curso_id)->first();      

     $estudantes = DB::table('estudantes')->join('users', 'estudantes.id', '=', 'users.id')
     ->join('medias', 'estudantes.id', '=', 'medias.estudante_id')
     ->select('users.id', 'users.nome','estudantes.numero_estudante')
     ->where('medias.curso_id', $this->curso_id)
     ->where('medias.cadeira_id', $this->cadeira_id)
     ->where('medias.ano', $this->ano)->get();
        
         return [
            'cadeira'=>[
                'cadeiraId' => $cadeira->id,
                'cadeiraNome' => $cadeira->nome,
            ],
            'curso'=>[
            'cursoId' => $curso->id,
            'cursoNome' => $curso->nome,
            ],

            
            'regenteId' => $regente?->id,    
            'regenteNome' => $regente?->nome,
            'estudantes' => $estudantes,
         ];
        
    }
}
