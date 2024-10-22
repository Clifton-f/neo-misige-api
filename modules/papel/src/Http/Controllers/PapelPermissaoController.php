<?php

namespace Modules\Papel\Http\Controllers;

use Modules\Papel\Http\Resources\PapelResource;
use Modules\Papel\Http\Requests\PapelPermissaoRequest;
use Modules\Papel\Http\Requests\UpdatePapelPermissaoRequest;

use Modules\Papel\Models\PapelPermissao;
use Modules\Papel\Models\Papel;

class PapelPermissaoController
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
    public function store(PapelPermissaoRequest $request)
    {
        //
        $campos=$request->validated();
        $papel=Papel::where('id',$campos['papel_id'])->first();
        return new PapelResource($papel);
        
        foreach($campos['permissoes'] as $permissao){
            PapelPermissao::create([
                'papel_id'=>$campos['papel_id'],
                'permissao_id'=>$permissao
            ]);

            
            
        }
        return new PapelResource($papel);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(PapelPermissao $papelPermissao)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PapelPermissao $papelPermissao)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePapelPermissaoRequest $request, PapelPermissao $papelPermissao)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy( $papelPermissao)
    {
        //
    }
}
