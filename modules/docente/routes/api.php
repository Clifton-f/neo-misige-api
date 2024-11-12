<?php
use Illuminate\Support\Facades\Route;

use Modules\Docente\Http\Controllers\DocenteController;
use Modules\Docente\Http\Controllers\NotaController;
use Modules\Docente\Http\Controllers\TurmaController;

Route::prefix('docente')->group(function(){
    Route::apiResource('/docentes', DocenteController::class);
    Route::apiResource('/turmas', TurmaController::class);
    Route::post("/notaestudante", [NotaController::class, 'show']);
    Route::post("/notasturma", [NotaController::class, 'index']);
    //Route::get("/nota/{ano}/{cadeira_id}/{curso_id}/{nome_avaliacao}/{estudante_id}", [NotaController::class, 'show']);
});
