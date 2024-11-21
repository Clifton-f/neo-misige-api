<?php

namespace Modules\Avaliacoes\Http\Controllers;

use Composer\DependencyResolver\Request;
use Modules\Avaliacoes\Http\Requests\ShowAvaliacaoRequest;
use Modules\Avaliacoes\Http\Requests\UpdateAvaliacaoRequest;
use Modules\Avaliacoes\Http\Requests\StoreAvaliacaoRequest;
use Modules\Avaliacoes\Http\Resources\AvaliacaoCollection;
use Modules\Avaliacoes\Http\Resources\AvaliacaoResource;
use Modules\Avaliacoes\Models\Avaliacao;

class AvaliacaoController
{
    /**
     * Display a listing of the resource.
     */
    public function index(ShowAvaliacaoRequest $request)
    {
        //

        $campos = $request->validated();
        if(array_key_exists('cadeiraId',$campos)){
            $avaliacoes=Avaliacao::where('curso_id', $campos["cursoId"])
                ->where('cadeira_id', $campos["cadeiraId"])->where('ano',$campos["ano"])->get();

            return new AvaliacaoCollection($avaliacoes);
        }else{
            $avaliacoes=Avaliacao::where('curso_id', $campos["cursoId"])
                ->where('ano',$campos["ano"])->get();

            return new AvaliacaoCollection($avaliacoes);
        }



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
        try {
            $campos = $request->validated();
            $avaliacao=Avaliacao::create([
                'curso_id' => $campos['cursoId'],
                'cadeira_id' => $campos['cadeiraId'],
                'nome_avaliacao' => $campos['nomeAvaliacao'],
                'peso' => ($campos['peso']/100),
                'ano' => $campos['ano'],
            ]);
        }catch (\Illuminate\Database\QueryException $ex){

        }

        return new AvaliacaoResource($avaliacao);


    }

    /**
     * Display the specified resource.
     */
    public function show(ShowAvaliacaoRequest $request)
    {

        //
        $campos = $request->validated();
        $avaliacao=Avaliacao::where('curso_id', $campos["cursoId"])
            ->where('cadeira_id', $campos["cadeiraId"])->where('ano',$campos["ano"])->first();
        return new AvaliacaoResource($avaliacao);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UpdateAvaliacaoRequest $avaliacao)
    {
        //
        dd($avaliacao);


    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreAvaliacaoRequest $request)
    {
        //
        return ($request);
        $campos = $request->validated();

        Avaliacao::where('cadeira_id',$campos['cadeiraId'])
                        ->where('curso_id',$campos['cursoId'])
                        ->where('nome_avaliacao',$campos['nomeAvaliacao'])
                        ->where('ano',$campos['ano'])->update([
                            "peso" => ($campos['peso']/100),
            ]);

       $avaliacao= Avaliacao::where('cadeira_id',$campos['cadeiraId'])
           ->where('curso_id',$campos['cursoId'])
           ->where('nome_avaliacao',$campos['nomeAvaliacao'])
           ->where('ano',$campos['ano'])->first();

        return new AvaliacaoResource($avaliacao);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ShowAvaliacaoRequest $request)
    {
        //
        $campos = $request->validated();

        return Avaliacao::where('cadeira_id',$campos['cadeiraId'])
            ->where('curso_id',$campos['cursoId'])
            ->where('nome_avaliacao',$campos['nomeAvaliacao'])
            ->where('ano',$campos['ano'])->delete();


    }

    public function editarPeso(UpdateAvaliacaoRequest $request)
    {

        $campos = $request->validated();

        Avaliacao::where('cadeira_id',$campos['cadeiraId'])
            ->where('curso_id',$campos['cursoId'])
            ->where('nome_avaliacao',$campos['nomeAvaliacao'])
            ->where('ano',$campos['ano'])->update([
                "peso" => ($campos['peso']/100),
            ]);

        $avaliacao= Avaliacao::where('cadeira_id',$campos['cadeiraId'])
            ->where('curso_id',$campos['cursoId'])
            ->where('nome_avaliacao',$campos['nomeAvaliacao'])
            ->where('ano',$campos['ano'])->first();

        return new AvaliacaoResource($avaliacao);

    }
    public function avaliacaoCurso(ShowAvaliacaoRequest $request)
    {
        $campos = $request->validated();


    }
}
