<?php
use Illuminate\Support\Facades\Route;

use Modules\Docente\Http\Controllers\DocenteController;
use Modules\Docente\Http\Controllers\NotaController;
use Modules\Docente\Http\Controllers\TurmaController;

//Route::get('/docentes', [DocenteController::class, 'index'])->name('docentes.index');
// Route::get('/docentes/create', [DocenteController::class, 'create'])->name('docentes.create');
// Route::post('/docentes', [DocenteController::class, 'store'])->name('docentes.store');
// Route::get('/docentes/{docente}', [DocenteController::class, 'show'])->name('docentes.show');
// Route::get('/docentes/{docente}/edit', [DocenteController::class, 'edit'])->name('docentes.edit');
// Route::put('/docentes/{docente}', [DocenteController::class, 'update'])->name('docentes.update');
// Route::delete('/docentes/{docente}', [DocenteController::class, 'destroy'])->name('docentes.destroy');

Route::prefix('docente')->group(function(){
    Route::apiResource('/docentes', DocenteController::class);
    Route::apiResource('/turmas', TurmaController::class);
    Route::post("/notaestudante", [NotaController::class, 'show']);
    Route::post("/notasturma", [NotaController::class, 'index']);
    //Route::get("/nota/{ano}/{cadeira_id}/{curso_id}/{nome_avaliacao}/{estudante_id}", [NotaController::class, 'show']);
});
