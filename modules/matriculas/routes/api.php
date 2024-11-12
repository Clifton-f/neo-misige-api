<?php
use Illuminate\Support\Facades\Route;

use Modules\Matriculas\Http\Controllers\CursoController;
use Modules\Matriculas\Http\Controllers\EstudanteController;
use Modules\Matriculas\Http\Resources\CadeiraResource;
use Modules\Matriculas\Models\Cadeira;


Route::prefix('matricula')->group(function(){
    Route::get('cursos',[CursoController::class,'index']);
    Route::get('cadeira',function(){
        return new CadeiraResource(Cadeira::where('id',21)->first());
    });
    Route::apiResource('/estudantes',EstudanteController::class);
});
