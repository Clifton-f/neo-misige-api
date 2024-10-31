<?php

namespace Modules\Cursos\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Cursos\Http\Resources\FaculdadeCollection;
use Modules\Cursos\Http\Resources\FaculdadeResource;
use Modules\Cursos\Models\Faculdade;

class FaculdadeController
{
    //
    public function index(){
        return new FaculdadeCollection(Faculdade::all());
    }
    public function store(Request $request){
        $campos = $request->validate([
            'nome' => 'required|string|unique:faculdades,nome',
            'director' => 'required|string|exists:users,id',
        ]);

        $faculdade = Faculdade::create($campos);
        return new FaculdadeResource($faculdade);
    }
    public function show($id){
        $faculdade = Faculdade::find($id);
        return new FaculdadeResource($faculdade);
    }
}
