<?php

namespace Modules\Docente\Http\Controllers;

use Illuminate\Http\Request;
use  Modules\Docente\Http\Resources\TurmaCollection;
use Modules\Docente\Models\Turma;

class TurmaController
{
    public function index(){
        return new TurmaCollection(Turma::all());
    }

    // public function update(){
    //     //return new PapelResource(Papel)
    // }

    public function show(Turma $turma){
        return new TurmaResource($turma);
    }
}
