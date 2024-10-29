<?php

namespace Modules\Avaliacoes\Http\Controllers;

use Composer\DependencyResolver\Request;
use Modules\Avaliacoes\Http\Requests\UpdateAvaliacaoRequest;
use Modules\Avaliacoes\Http\Requests\StoreAvaliacaoRequest;
use Modules\Avaliacoes\Http\Resources\AvaliacaoResource;
use Modules\Avaliacoes\Models\Avaliacao;

class AvaliacaoController
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
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
    public function store(StoreAvaliacaoRequest $request)
    {



    }

    /**
     * Display the specified resource.
     */
    public function show(Avaliacao $avaliacao)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Avaliacao $avaliacao)
    {
        //


    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAvaliacaoRequest $request)
    {
        //
        $campos = $request->validate();
        $avaliacao = Avaliacao::where('cadeira_id',$campos['cadeira_id'])
                        ->where('curso_id',$campos['curso_id'])
                        ->where('nome_avaliacao',$campos['nome_avaliacao'])
                        ->where('ano',gmdate('Y'));
        $avaliacao->peso = $campos['peso'];
        $avaliacao->save();
        return new AvaliacaoResource($avaliacao);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Avaliacao $avaliacao)
    {
        //
    }
}
