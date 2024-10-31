<?php

namespace Modules\Cursos\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Cursos\Http\Requests\StoreCursoRequest;
use Modules\Cursos\Http\Resources\CursoCollection;
use Modules\Cursos\Http\Resources\CursoResource;
use Modules\Cursos\Models\Curso;

class CursoController
{
    //
    public function index(){
        return new CursoCollection(Curso::all());
    }
    public function show($id){
        $curso = new CursoResource(Curso::where("id", $id)->first());
        return $curso->getCurso();
    }
    public function store(StoreCursoRequest $request){
        //
        $campos= $request->validated();

        $curso = Curso::create(
            [
                'nome' => $campos['nome'],
                'descricao' => $campos['descricao'],
                'duracao_minima'=>$campos['duracaoMinima'],
                'duracao_maxima'=>$campos['duracaoMaxima'],
                'departamento_id'=>$campos['departamentoId'],
            ]
        );
        return new CursoResource($curso);

    }
    public function update(Request $request, Curso $id){
        //
    }
    public function destroy(Curso $id){
        return Curso::destroy($id);
    }
}
