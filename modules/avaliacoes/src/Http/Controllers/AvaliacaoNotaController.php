<?php

namespace Modules\Avaliacoes\Http\Controllers;

use Modules\Avaliacoes\Http\Requests\UpdateAvaliacaoNotaRequest;
use Modules\Avaliacoes\Http\Requests\StoreAvaliacaoNotaRequest;
use Modules\Avaliacoes\Models\AvaliacaoNota;
use Modules\Avaliacoes\Models\Estudante;

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
        $campos = $request->validated();
        $estudante = Estudante::where('numero_estudante',$campos['numeroEstudante'])->first();
        $update=AvaliacaoNota::where('cadeira_id',$campos['cadeiraId'])
        ->where('curso_id',$campos['cursoId'])
        ->where('nome_avaliacao',$campos['nomeAvaliacao'])
        ->where('estudante_id',$estudante->id)->where('ano',$campos['ano'])
        ->update([
            'nota'=>$campos['nota']
        ]);

        if($update==0){
            return response()->json([
                'success'=>'false',
                'message'=>'esse estudante não é afectado por essa avaliacao'
            ])->setStatusCode(400);
        }
        return response()->json([
            'success'=>'true',
            'message'=>'Nota lançada com sucesso'
        ])->setStatusCode(200);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AvaliacaoNota $avaliacaoNota)
    {
        //
    }
}
