<?php
use Illuminate\Support\Facades\Route;

use Modules\Cursos\Http\Controllers\CadeiraController;
use Modules\Cursos\Http\Controllers\CatalogoController;
use Modules\Cursos\Http\Controllers\CursoController;
use Modules\Cursos\Http\Controllers\DepartamentoController;
use Modules\Cursos\Http\Controllers\FaculdadeController;

// Route::get('/cursos', [CursosController::class, 'index'])->name('cursos.index');
// Route::get('/cursos/create', [CursosController::class, 'create'])->name('cursos.create');
// Route::post('/cursos', [CursosController::class, 'store'])->name('cursos.store');
// Route::get('/cursos/{curso}', [CursosController::class, 'show'])->name('cursos.show');
// Route::get('/cursos/{curso}/edit', [CursosController::class, 'edit'])->name('cursos.edit');
// Route::put('/cursos/{curso}', [CursosController::class, 'update'])->name('cursos.update');
// Route::delete('/cursos/{curso}', [CursosController::class, 'destroy'])->name('cursos.destroy');
Route::prefix('curso')->group(function(){
    Route::apiResource('/cursos',CursoController::class);
    Route::apiResource('/cadeiras',CadeiraController::class);
    Route::apiResource('/departamentos',DepartamentoController::class);
    Route::post('/catalogo',[CatalogoController::class,'store']);
    Route::apiResource('/faculdades',FaculdadeController::class);
});
