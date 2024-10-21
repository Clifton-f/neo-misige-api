<?php

namespace Modules\Matriculas\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Modules\Matriculas\Models\User;
use Modules\Matriculas\Http\Requests\StoreEstudanteRequest;
use Modules\Matriculas\Http\Requests\UpdateEstudanteRequest;
use Modules\Matriculas\Http\Resources\EstudanteResource;
use Modules\Matriculas\Models\Estudante;

class EstudanteController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreEstudanteRequest $request)
    {
        //
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

        

        $estudante = Estudante::create([
            "id"=>$user->id,
            "curso_id"=>$campos['curso_id'],
            "data_entrada"=>$campos['data_entrada'],
            "numero_estudante"=>$campos["numero_estudante"]
        ]);
        
        return new EstudanteResource($estudante);
    }

    /**
     * Display the specified resource.
     */
    public function show(Estudante $estudante)
    {
        //
        return new EstudanteResource($estudante);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Estudante $estudante)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateEstudanteRequest $request, Estudante $estudante)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Estudante $estudante)
    {
        //
    }
}
