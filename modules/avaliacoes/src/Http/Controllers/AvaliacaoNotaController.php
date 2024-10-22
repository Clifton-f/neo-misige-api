<?php

namespace Modules\Avaliacoes\Http\Controllers;

use Modules\Avaliacoes\Http\Requests\UpdateAvaliacaoNotaRequest;
use Modules\Avaliacoes\Http\Requests\StoreAvaliacaoNotaRequest;
use Modules\Avaliacoes\Models\AvaliacaoNota;

class AvaliacaoNotaController
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
    public function store(StoreAvaliacaoNotaRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(AvaliacaoNota $avaliacaoNota)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(AvaliacaoNota $avaliacaoNota)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAvaliacaoNotaRequest $request)
    {
        //
        $campos = $request->validate();
        $avaliacaoNota=AvaliacaoNota::where('cadeira_id',$campos['cadeira_id'])
        ->where('curso_id',$campos['curso_id'])
        ->where('nome_avaliacao',$campos['nome_avaliacao'])
        ->where('estudante_id',$campos['estudante_id'])->where('ano',gmdate('Y'));
        $avaliacaoNota->nota=$campos['nota'];
        $avaliacaoNota->save();
        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AvaliacaoNota $avaliacaoNota)
    {
        //
    }
}
