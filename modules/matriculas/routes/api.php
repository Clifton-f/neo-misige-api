<?php
use Illuminate\Support\Facades\Route;

use Modules\Matriculas\Http\Controllers\CursoController;
use Modules\Matriculas\Http\Controllers\EstudanteController;
use Modules\Matriculas\Http\Resources\CadeiraResource;
use Modules\Matriculas\Models\Cadeira;

// Route::get('/matriculas', [MatriculasController::class, 'index'])->name('matriculas.index');
// Route::get('/matriculas/create', [MatriculasController::class, 'create'])->name('matriculas.create');
// Route::post('/matriculas', [MatriculasController::class, 'store'])->name('matriculas.store');
// Route::get('/matriculas/{matricula}', [MatriculasController::class, 'show'])->name('matriculas.show');
// Route::get('/matriculas/{matricula}/edit', [MatriculasController::class, 'edit'])->name('matriculas.edit');
// Route::put('/matriculas/{matricula}', [MatriculasController::class, 'update'])->name('matriculas.update');
// Route::delete('/matriculas/{matricula}', [MatriculasController::class, 'destroy'])->name('matriculas.destroy');

Route::prefix('matricula')->group(function(){
    Route::get('cursos',[CursoController::class,'index']);
    Route::get('cadeira',function(){
        return new CadeiraResource(Cadeira::where('id',21)->first());
    });
    Route::apiResource('/estudantes',EstudanteController::class);
});
