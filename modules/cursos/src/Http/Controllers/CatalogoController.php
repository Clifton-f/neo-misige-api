<?php

namespace Modules\Cursos\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Cursos\Http\Requests\StoreCatalogoRequest;
use Modules\Cursos\Http\Resources\CursoResource;
use Modules\Cursos\Models\Catalogo;
use Modules\Cursos\Models\Curso;
use Modules\Inscricao\Http\Resources\CatalogoCollection;

class CatalogoController
{
    //
    public function index(){
        return new CatalogoCollection(Catalogo::all());
    }
    public function store(StoreCatalogoRequest $request){
        $campos = $request->validated();
        try {
            Catalogo::create([
                'cadeira_id' => $campos['cadeiraId'],
                'curso_id' => $campos['cursoId'],
                "ano" => $campos['ano'],
                'semestre' => $campos['semestre'],
                'precedencia'=>$campos['precedencia'],
            ]);

        }catch(\Exception $e){
            Catalogo::create([
                'cadeira_id' => $campos['cadeiraId'],
                'curso_id' => $campos['cursoId'],
                "ano" => $campos['ano'],
                'semestre' => $campos['semestre'],]);
        }

        $curso= new CursoResource(Curso::where('id',$campos["curso_id"])->first());
        return $curso->getCurso();

    }

}
