<?php

namespace Modules\Inscricao\Http\Controllers;

use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Facades\DB;
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
        $estudante = Estudante::where('numero_estudante',$campos['estudanteId'])->first();

        foreach ($campos['cadeiraId'] as $cadeira){


            try {
                Media::create([
                    'cadeira_id'=>$cadeira,
                    'curso_id'=>$estudante->curso_id,
                    'estudante_id'=>$estudante->id,
                    'ano'=>gmdate("Y"),
                ]);
            }catch (\Illuminate\Database\QueryException $ex){

            }

        }
        $medias = Media::where('estudante_id', $estudante->id)->where('ano',gmdate("Y"))->get();

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
    public function destroy(StoreMediaRequest $media)
    {
        //
        $campos = $media->validated();
        $inscricao = Media::where('estudante_id', $campos['estudanteId'])
            ->where('cadeira_id', $campos['cadeiraId'])->first();

        return $inscricao->delete();


    }
    public function cadeiras(ShowMediaRequest $id){
        $campos = $id->validated();
        $estudante=Estudante::where('numero_estudante',$campos['estudanteId'])->first();
        //return $estudante;
        $aprovadas = DB::table('medias')->join('estudantes','estudantes.id','=','medias.estudante_id')
            ->where('estudante_id',$estudante->id)
            ->where('media','>=10')
            ->pluck('cadeira_id');
        //return $aprovadas;


        $cadeiras = DB::table('turmas')
            ->join('cadeiras', 'turmas.cadeira_id', '=', 'cadeiras.id')
            ->join('cadeira_curso', function (JoinClause $join) {
                $join->on('turmas.curso_id', '=', 'cadeira_curso.curso_id')->on('turmas.cadeira_id','=','cadeira_curso.cadeira_id');
            })
            ->where('turmas.curso_id',$estudante->curso_id)
            ->where('turmas.ano',gmdate('Y'))
            ->whereNotIn('turmas.cadeira_id',$aprovadas)
            ->select("cadeiras.id as cadeiraId", "cadeiras.nome","turmas.ano as ano","cadeira_curso.ano as ano","cadeira_curso.semestre as semestre")
            ->get();

        return $cadeiras;
    }
}
