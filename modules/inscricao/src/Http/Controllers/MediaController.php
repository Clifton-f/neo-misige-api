<?php

namespace Modules\Inscricao\Http\Controllers;

use Modules\Avaliacoes\Http\Resources\MediaResource;
use Modules\Inscricao\Http\Requests\StoreMediaRequest;
use Modules\Inscricao\Http\Requests\UpdateMediaRequest;
use Modules\Inscricao\Http\Requests\ShowMediaRequest;
use Modules\Inscricao\Http\Resources\CadeiraCollection;
use Modules\Inscricao\Http\Resources\CadeiraResource;
use Modules\Inscricao\Http\Resources\CatalogoCollection;
use Modules\Inscricao\Http\Resources\MediaCollection;
use Modules\Inscricao\Models\Cadeira;
use Modules\Inscricao\Models\Catalogo;
use Modules\Inscricao\Models\Estudante;
use Modules\Inscricao\Models\Media;

class MediaController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return new MediaCollection(Media::all());
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
    public function store(StoreMediaRequest $request)
    {

        //
        $campos = $request->validated();


        foreach ($campos['cadeira_id'] as $cadeira){


           Media::create([
               'cadeira_id'=>$cadeira,
               'curso_id'=>$campos['curso_id'],
               'estudante_id'=>$campos['estudante_id'],
               'ano'=>$campos['ano'],
           ]);
        }
        $medias = Media::where('estudante_id', $campos['estudante_id'])->where('ano',$campos['ano'])->get();

        return new MediaCollection($medias);

    }

    /**
     * Display the specified resource.
     */
    public function show(ShowMediaRequest $estudante)
    {
        //
        $medias = Media::where('estudante_id',$estudante)->get();
        return new MediaCollection($medias);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Media $media)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMediaRequest $request, Media $media)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Media $media)
    {
        //
    }
    public function cadeiras(ShowMediaRequest $id){
        $campos = $id->validated();
        $estudante=Estudante::where('id',$campos['estudante_id'])->first();
        //return $estudante;
        $catalogo = Catalogo::where('curso_id',$estudante->curso_id)->get();
        return new CatalogoCollection($catalogo);
    }
}
