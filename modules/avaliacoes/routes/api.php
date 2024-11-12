<?php
use Illuminate\Support\Facades\Route;
use Modules\Avaliacoes\Http\Controllers\AvaliacaoNotaController;
use Modules\Avaliacoes\Http\Controllers\AvaliacaoController;
use Modules\Avaliacoes\Http\Controllers\TurmaController;

//use Modules\Avaliacoes\Http\Controllers\AvaliacoesController;

 //Route::get('/avaliacoes', [AvaliacoesController::class, 'index'])->name('avaliacoes.index');
// Route::get('/avaliacoes/create', [AvaliacoesController::class, 'create'])->name('avaliacoes.create');
// Route::post('/avaliacoes', [AvaliacoesController::class, 'store'])->name('avaliacoes.store');
// Route::get('/avaliacoes/{avaliaco}', [AvaliacoesController::class, 'show'])->name('avaliacoes.show');
// Route::get('/avaliacoes/{avaliaco}/edit', [AvaliacoesController::class, 'edit'])->name('avaliacoes.edit');
// Route::put('/avaliacoes/{avaliaco}', [AvaliacoesController::class, 'update'])->name('avaliacoes.update');
// Route::delete('/avaliacoes/{avaliaco}', [AvaliacoesController::class, 'destroy'])->name('avaliacoes.destroy');

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
