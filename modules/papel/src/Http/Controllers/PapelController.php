<?php

namespace Modules\Papel\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\Papel\Models\Papel;
use Modules\Papel\Http\Resources\PapelCollection;
use Illuminate\Http\Request;
use Modules\Papel\Http\Requests\PapelRequest;
use Modules\Papel\Http\Resources\PapelResource;
use Modules\Papel\Models\PapelPermissao;

class PapelController extends Controller
{
    //
    public function index(){
        return new PapelCollection(Papel::all());
    }
    public function store(PapelRequest $request){

       $papel=Papel::create([
            "nome"=>$request->input('nome'),
            "descricao"=>$request->input('descricao')
        ]);
        $permissoes = $request->input("permissoes");
        $papelPermissao=[];

        foreach($permissoes as $permissao){
        $papelPermissao[]=PapelPermissao::create([
            "papel_id"=>$papel->id,
            "permissao_id"=>$permissao
        ]);
            
        }
        return new PapelResource($papel);

    }
    public function update(){
        //return new PapelResource(Papel)
    }
    public function show(Papel $papel){
        return new PapelResource($papel);
    }
    public function destroy(Papel $papel){
        return Papel::where('id',$papel->id)->delete();

    }
}
