<?php

namespace Modules\Docente\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Docente\Models\Docente;
use Modules\Docente\Models\Cadeira;
use Modules\Docente\Models\Curso;
use Modules\Docente\Models\Nota;
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
        return $this->nome;
        $cadeira = Cadeira::where('id', $this->cadeira_id)->first();
        $curso = Curso::where('id', $this->curso_id)->first();  
        $estudante = Estudante::where('id', $this->estudante_id)->with(User::class)->first();

        return [
            'cadeiraId' => $cadeira->id,
            'cadeira' => $cadeira->nome,
            'cursoId' => $curso_id,
            'numero_estudante' => $estudante->numero_estudante,
            'nome_estudante' => $estudante->nome,
            'nota' => $this->nota,
            'peso' => $this->peso
        ];
    }
}
