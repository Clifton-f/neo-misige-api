<?php
use Illuminate\Support\Facades\Route;

use Modules\Cursos\Http\Controllers\CadeiraController;
use Modules\Cursos\Http\Controllers\CatalogoController;
use Modules\Cursos\Http\Controllers\CursoController;
use Modules\Cursos\Http\Controllers\DepartamentoController;
use Modules\Cursos\Http\Controllers\FaculdadeController;


Route::prefix('curso')->group(function(){
    Route::apiResource('/cursos',CursoController::class);
    Route::apiResource('/cadeiras',CadeiraController::class);
    Route::apiResource('/departamentos',DepartamentoController::class);
    Route::post('/catalogo',[CatalogoController::class,'store']);
    Route::apiResource('/faculdades',FaculdadeController::class);
});
