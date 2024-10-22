<?php

namespace Modules\Docente\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Docente\Models\Docente;
use Modules\Docente\Http\Resources\DocenteResource;
use Modules\Docente\Http\Resources\DocenteCollection;
class DocenteController
{
    public function index(){
        return new DocenteCollection(Docente::all());
    }

    public function store(DocenteRequest $request){

        $docente = Docente::create([
            "id"=>$request->input('id'),
            "formacao"=>$request->input('formacao')
        ]);

        return new DocenteResource($docente);
    }
    public function update(){
        //return new PapelResource(Papel)
    }
    public function show(Docente $docente){
        return new DocenteResource($docente);
    }
    public function destroy(Docente $docente){
        return Docente::where('id' ,$docente->id)->delete();
    }
}
