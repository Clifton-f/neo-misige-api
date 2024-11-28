<?php

namespace Modules\Docente\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Docente\Http\Requests\ShowNotasTurmaRequest;
use  Modules\Docente\Http\Resources\TurmaCollection;

use Modules\Docente\Http\Resources\TurmaResource;
use Modules\Docente\Models\Turma;

class TurmaController
{
    public function index(){
        return new TurmaCollection(Turma::all());
    }

    // public function update(){
    //     //return new PapelResource(Papel)
    // }

    public function show(ShowNotasTurmaRequest $request){
        $campos = $request->validated();
        $turma = Turma::where("curso_id", $campos["cursoId"])
            ->where("cadeira_id", $campos["cadeiraId"])
            ->where("ano", $campos["ano"])->first();


        return new TurmaResource($turma);
    }
    public function update()
    {

    }
}
