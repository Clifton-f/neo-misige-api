<?php

namespace Modules\Matriculas\Http\Controllers;

use Modules\Matriculas\Http\Requests\StoreCursoRequest;
use Modules\Matriculas\Http\Requests\UpdateCursoRequest;
use Modules\Matriculas\Http\Resources\CursoCollection;
use Modules\Matriculas\Http\Resources\CursoResource;
use Modules\Matriculas\Models\Curso;

class CursoController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //return new CursoCollection(Curso::all());
        return new CursoCollection(Curso::all());
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
    public function store(StoreCursoRequest $request)
    {
        //
        $curso = Curso::create($request->all());
        return new CursoResource($curso);
    }

    /**
     * Display the specified resource.
     */
    public function show(Curso $curso)
    {
        //
        $cursoResource =new CursoResource($curso);
        return $cursoResource->getCurso();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Curso $curso)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCursoRequest $request, Curso $curso)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Curso $curso)
    {
        //
    }
}
