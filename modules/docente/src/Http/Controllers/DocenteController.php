<?php

namespace Modules\Docente\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Modules\Docente\Http\Requests\DocenteRequest;

use Modules\Docente\Http\Requests\DocenteRequest as RequestsDocenteRequest;
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

        $user = User::create([
        'nome'=>$campos['nome'],
        'email'=>$campos['email'],
        'password'=>Hash::make($campos['password']),
        'BI'=>$campos['BI'],
        'NUIT'=>$campos['NUIT'],
        'contacto_1'=>$campos['contacto_1'],
        'contacto_2'=>$campos['contacto_2'],
        'papel_id'=>$campos['papel_id']
        ]);

        

        
        $docente = Docente::create([
            "id"=>$user->id,
            "formacao"=>$campos['formacao']
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
