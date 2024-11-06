<?php

namespace Modules\Avaliacoes\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Avaliacoes\Http\Requests\ShowTurmaRequest;

class TurmaController
{
    //
    public function index(){

    }
    public function anosActivo(ShowTurmaRequest $request){
        $campos = $request->validated();
        $anos = DB::table("turmas")->where('curso_id',$campos['cursoId'])
            ->select('ano')
            ->pluck('ano')->toArray();
        return array_unique($anos);
    }
    public function showTurmas(ShowTurmaRequest $request){
        $campos = $request->validated();
        $cadeiras = DB::table('turmas')
            ->join('cadeiras','turmas.cadeira_id','=','cadeiras.id')
            ->where('turmas.curso_id',$campos['cursoId'])
            ->where('turmas.ano',$campos['ano'])->select("cadeiras.nome as cadeiraNome","cadeiras.id as cadeiraId")
            ->get();
        return $cadeiras;
    }
}
