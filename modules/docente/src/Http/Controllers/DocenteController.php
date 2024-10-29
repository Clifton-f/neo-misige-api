<?php

namespace Modules\Docente\Http\Controllers;

use Modules\Docente\Models\User;
use Illuminate\Support\Facades\Hash;
use Modules\Docente\Http\Requests\DocenteRequest;
use Modules\Docente\Models\Docente;
use Modules\Docente\Http\Resources\DocenteResource;
use Modules\Docente\Http\Resources\DocenteCollection;
class DocenteController
{
    public function index(){
        return new DocenteCollection(Docente::all());
    }

    public function store(DocenteRequest $request){

        $campos = $request->validated();
        //return $campos;

        //return $campos;

        $user = User::create($campos);




       Docente::create([
            "id"=>$user->id,
            "formacao"=>$campos['formacao']
        ]);
       $docente = Docente::where("id",$user->id)->first();


        return new DocenteResource($docente);
    }
    public function update(){
        //return new PapelResource(Papel)
    }
    public function show(Docente $docente){
        $resource = new DocenteResource($docente);
        return $resource->getDocente();
    }
    public function destroy(Docente $docente){
        return Docente::where('id' ,$docente->id)->delete();
    }
}
