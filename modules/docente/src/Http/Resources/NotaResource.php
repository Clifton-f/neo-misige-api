<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Docente\Models\Docente;
use Modules\Docente\Models\Cadeira;
use Modules\Docente\Models\Curso;
use Modules\Docente\Models\Nota;
use Modules\Docente\Models\Estudante;
use Modules\Docente\Http\Resources\NotaResources;
class NotaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        //
        $cadeira = Cadeira::select('id', 'nome')->where('id', $this->cadeira_id)->first();
        $curso = Curso::select('id', 'nome')->where('id', $this->curso_id)->first();
        $estudante = Estudante::select('users.id as id', 'numero_estudante', 'nome')
            ->where('users.id', $this->estudante_id)
            ->join('users', 'users.id', 'estudantes.id')
            ->first();

        return [
            'cadeira' => $cadeira,
            'curso' => $curso,
            'estudante'=> $estudante,
            'ano' => $this->ano,
            'avaliacao' => [
                'nota' => $this->nota,
                'peso' => $this->peso,
            ],
        ];


    }

}
