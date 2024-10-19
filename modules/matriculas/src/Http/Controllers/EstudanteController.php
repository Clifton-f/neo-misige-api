<?php

namespace Modules\Matriculas\Http\Controllers;

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
        return new EstudanteResource(Estudante::create($request->all()));
    }

    /**
     * Display the specified resource.
     */
    public function show(Estudante $estudante)
    {
        //
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
