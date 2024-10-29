<?php

namespace Modules\Certificado\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;
use Modules\Certificado\Models\Estudante;
use function Laravel\Prompts\table;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $estudante = Estudante::where('id', $this->id)->first();
        $faculdadde = DB::table('faculdades');
        $curso = DB::table('cursos')
        ->join('departamentos', 'departamentos.id', '=', 'cursos.departamento_id')
        ->join('faculdades', 'faculdades.id', '=', 'departamentos.faculdade_id')
        ->select('curso.nome as curso','faculdades.nome as faculdade')->where('cursos.id', $estudante->curso_id)->first;
        return [

            'numerEstudante'=>$estudante->numero_estudante,
            'nome'=>$this->nome,
            'curso_faculdade'=>$estudante,
            'nomeReitor'=>'Dr. António Silva',

        ];
    }
}
