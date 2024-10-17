<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\Auth\Http\Controllers\AuthController;
//use Modules\Papel\Http\Controllers\PapelController;
use Modules\Papel\Http\Controllers\PapelController;
use Modules\Auth\Http\Controllers\UserController;
use Modules\Papel\Http\Controllers\PapelPermissaoController;
use Modules\Papel\Http\Controllers\PermissaoController;
use Modules\Papel\Http\Resources\PapelResource;
use Modules\Papel\Models\Papel;
use Modules\Papel\Tests\PapelServiceProviderTest;

Route::prefix('auth')->group(function(){
    Route::apiResource('auth', AuthController::class)->names('auth');
    Route::post('login',[AuthController::class, 'login']);
    Route::post('/logout',[AuthController::class, 'logout'])->middleware('auth:api');
    
    Route::resource('users',UserController::class)->middleware('auth:api');//middleware('auth:api');//->middleware('auth:sanctum');


    //Route::post('me',AuthController::class,'me')->middleware('auth:api');
    
});

Route::prefix('papel')->group(function(){
    Route ::apiResource('/papeis', PapelController::class)->middleware('auth:api');
    Route::apiResource('/permissões',PermissaoController::class)->middleware('auth:api');
    
});