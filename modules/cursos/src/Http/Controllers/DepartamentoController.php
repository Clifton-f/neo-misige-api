<?php

namespace Modules\Cursos\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Cursos\Http\Requests\StoreCadeiraController;
use Modules\Cursos\Http\Requests\StoreDepartamentoRequest;
use Modules\Cursos\Http\Resources\CadeiraCollection;
use Modules\Cursos\Http\Resources\CadeiraResource;
use Modules\Cursos\Http\Resources\DepartamentoCollection;
use Modules\Cursos\Http\Resources\DepartamentoResource;
use Modules\Cursos\Models\Cadeira;
use Modules\Cursos\Models\Departamento;


class DepartamentoController
{
    //
    public function index(){
        return new DepartamentoCollection(Departamento::all());
    }
    public function store(StoreDepartamentoRequest $request){
        $campos  = $request->validated();

        $departamento = Departamento::create([
            'nome' => $campos['nome'],
            'descricao' => $campos['descricao'],
            'faculdade_id' => $campos['faculdadeId'],
        ]);
        return new DepartamentoResource($departamento);
    }
    public function show(Departamento $departamento)
    {
        return new DepartamentoResource($departamento);
    }
}
