<?php
use Illuminate\Support\Facades\Route;
use Modules\Avaliacoes\Http\Controllers\AvaliacaoNotaController;
use Modules\Avaliacoes\Http\Controllers\AvaliacaoController;
use Modules\Avaliacoes\Http\Controllers\TurmaController;


Route::prefix('avaliacao')->group(function(){
    Route::patch('/lancarnota',[AvaliacaoNotaController::class,'update']);
    Route::post('/adicionaravaliacao',[AvaliacaoController::class,'store']);
    Route::put('/editarpesoavaliacao',[AvaliacaoController::class,'editarPeso']);
    Route::post('/veravaliacao',[AvaliacaoController::class,'show']);
    Route::post('/veravaliacoesturma',[AvaliacaoController::class,'index']);
    Route::post('/veravaliacoescurso',[AvaliacaoController::class,'index']);
    Route::delete('eliminaravaliacao',[AvaliacaoController::class,'destroy']);
    Route::post('/veranos',[TurmaController::class,'anosActivo']);
    Route::post('/verturmas',[TurmaController::class,'showTurmas']);

});
