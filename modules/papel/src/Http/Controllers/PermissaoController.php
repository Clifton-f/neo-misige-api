<?php

namespace Modules\Papel\Http\Controllers;

use Modules\Papel\Http\Requests\PermissaoRequest;
use Modules\Papel\Http\Requests\StorePermissaoRequest;
use Modules\Papel\Http\Requests\UpdatePermissaoRequest;
use Modules\Papel\Http\Resources\PermissaoCollection;
use Modules\Papel\Http\Resources\PermissaoResource;
use Modules\Papel\Models\Permissao;

class PermissaoController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new PermissaoCollection(Permissao::all());
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
    public function store(StorePermissaoRequest $request)
    {
        //
        $campos = $request->validated();

        return Permissao::create($campos);


    }

    /**
     * Display the specified resource.
     */
    public function show($permissao)
    {
        //
        return new PermissaoCollection(Permissao::where('id',$permissao)->get());
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Permissao $permissao)
    {
        //

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(PermissaoRequest $request, $id)
    {
        //

        $permissao=Permissao::where('id',$id)->get();
        $permissao;
        
        return new PermissaoResource($permissao->get());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
        $permissao=Permissao::find($id);
        return $permissao->truncate();
        
    }
}
