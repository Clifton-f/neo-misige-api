<?php

use Illuminate\Support\Facades\Route;
use Modules\Auth\Http\Controllers\AuthController;
use Modules\Auth\Http\Controllers\UserController;

/*
 *--------------------------------------------------------------------------
 * API Routes
 *--------------------------------------------------------------------------
 *
 * Here is where you can register API routes for your application. These
 * routes are loaded by the RouteServiceProvider within a group which
 * is assigned the "api" middleware group. Enjoy building your API!
 *
*/

/*Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    
});*/
Route::prefix('auth')->group(function(){
    Route::apiResource('auth', AuthController::class)->names('auth');
    Route::post('/login',[AuthController::class, 'login']);
Route::post('/logout',[AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::resource('users',UserController::class)->middleware('auth:sanctum');

});


