<?php

use Modules\Auth\Http\Controllers\AuthController;
use Modules\Papel\Http\Controllers\PapelController;
use Modules\Papel\Http\Controllers\PermissaoController;
use Illuminate\Support\Facades\Route;


Route::prefix('papel')->group(function(){
    Route::post('login',[AuthController::class, 'login']);
    Route ::put('/papeis', [PapelController::class,'update'])->middleware('auth:api');
    Route ::apiResource('/papeis', PapelController::class)->middleware('auth:api');
    Route::apiResource('/permissoes',PermissaoController::class)->middleware('auth:api');
    Route::post('/addpermissoes',[PapelPermissaoController::class,'store']);



});
