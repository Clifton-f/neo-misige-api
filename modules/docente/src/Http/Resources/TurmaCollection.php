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
        return parent::toArray($request);
    }
}
