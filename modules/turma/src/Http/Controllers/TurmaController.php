<?php

namespace Modules\Turma\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Turma\Http\Requests\ShowTurmaRequest;
use Modules\Turma\Http\Resources\TurmaResource;
use Modules\Turma\Models\Turma;

class TurmaController
{
    //
    public function show(ShowTurmaRequest $request)
    {
        $campos = $request->validated();
        $turma = Turma::where("curso_id", $campos["curso_id"])
            ->where("cadeira_id", $campos["cadeira_id"])
            ->where("ano", $campos["ano"])->get();

        return new TurmaResource($turma);
    }
}
