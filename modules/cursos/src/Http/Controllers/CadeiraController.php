<?php

namespace Modules\Cursos\Http\Controllers;

use Illuminate\Http\Request;

use Modules\Cursos\Http\Requests\StoreCadeiraRequest;
use Modules\Cursos\Http\Requests\UpdateCadeiraRequest;
use Modules\Cursos\Http\Resources\CadeiraCollection;
use Modules\Cursos\Models\Cadeira;
use Modules\Cursos\Http\Resources\CadeiraResource;

class CadeiraController
{
    //
    public function index(){

        return new CadeiraCollection(Cadeira::all());

    }
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCadeiraRequest $request)
    {
        //
        $campos = $request->validated();
        $cadeira =Cadeira::create([
            'nome' => $campos['nome'],
            'departamento_id' => $campos['departamentoId'],

        ]);

        return new CadeiraResource($cadeira);
    }

    /**
     * Display the specified resource.
     */
    public function show(Cadeira $cadeira)
    {
        //
        return new CadeiraResource($cadeira);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Cadeira $cadeira)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCadeiraRequest $request, Cadeira $cadeira)
    {
        //
        $campos = $request->validated();

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cadeira $cadeira)
    {
        //
        return Cadeira::destroy($cadeira);
    }

}
