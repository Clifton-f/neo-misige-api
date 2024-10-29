<?php

namespace Modules\Docente\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Docente\Http\Requests\ShowNotasTurmaRequest;
use Modules\Docente\Models\Nota;
use Modules\Docente\Http\Resources\NotaResource;
use Modules\Docente\Http\Resources\NotaCollection;

class NotaController
{
    public function index(ShowNotasTurmaRequest $request){

        $campos = $request->validated();
        $notas = Nota::where('nome_avaliacao', $campos['nome_avaliacao'])
            ->where('curso_id', $campos['curso_id'])
            ->where('cadeira_id', $campos['cadeira_id'])
            -> where('ano', $campos['ano'])->get();


        return new NotaCollection($notas);


    }

    public function show(Request $request){
        $nome_avaliacao = $request->input('nomeAvaliacao');
        $curso_id = $request->input('cursoId');
        $cadeira_id = $request->input('cadeiraId');
        $estudante_id = $request->input('estudanteId');
        $ano = $request->input('ano');

        $resource = new NotaResource(
            Nota::where('nome_avaliacao', $nome_avaliacao)
                ->where('curso_id', $curso_id)
                ->where('cadeira_id', $cadeira_id)
                ->where('estudante_id', $estudante_id)
                -> where('ano', $ano)->first()
        );
        return $resource;
    }


    public function update(){
        //
    }
}
