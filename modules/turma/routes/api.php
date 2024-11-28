<?php
use Illuminate\Support\Facades\Route;
use Modules\Docente\Http\Controllers\TurmaController;

//use Modules\Turma\Http\Controllers\TurmaController;
Route::prefix('turma')->group(function () {
    Route::post('/pauta', [TurmaController::class, 'show']);
});
