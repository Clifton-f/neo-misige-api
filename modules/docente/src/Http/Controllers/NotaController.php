<?php

namespace Modules\Docente\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Docente\Models\Nota;
use Modules\Docente\Http\Resources\NotaResource;
use Modules\Docente\Http\Resources\NotaCollection;

class NotaController
{
    public function index(Request $request){
        $nome_avaliacao = $request->input('nomeAvaliacao');
        $curso_id = $request->input('cursoId');
        $cadeira_id = $request->input('cadeiraId');
        $ano = $request->input('ano');

        return new NotaCollection(
            Nota::where('nome_avaliacao', $nome_avaliacao)
            ->where('curso_id', $curso_id)
            ->where('cadeira_id', $cadeira_id)
            -> where('ano', $ano)->get()
        );
    }

    public function show(Request $request){
        $nome_avaliacao = $request->input('nomeAvaliacao');
        $curso_id = $request->input('cursoId');
        $cadeira_id = $request->input('cadeiraId');
        $estudante_id = $request->input('estudanteId');
        $ano = $request->input('ano');

        return new NotaResource(
            Nota::where('nome_avaliacao', $nome_avaliacao)
            ->where('curso_id', $curso_id)
            ->where('cadeira_id', $cadeira_id)
            ->where('estudante_id', $estudante_id)
            -> where('ano', $ano)->first()
        );
    }


    public function update(){
        //
    }
}
