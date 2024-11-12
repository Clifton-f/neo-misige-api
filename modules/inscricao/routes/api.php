<?php
use Illuminate\Support\Facades\Route;
use Modules\Inscricao\Http\Controllers\MediaController;


Route::prefix('inscricao')->group(function(){
    Route::apiResource('/inscricoes',MediaController::class);

    Route::controller(MediaController::class)->group(function(){
        Route::post('cadeiras',"cadeiras");

    });
});
