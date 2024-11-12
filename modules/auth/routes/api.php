<?php

use Modules\Auth\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;

// Route::get('/auths', [AuthController::class, 'index'])->name('auths.index');
// Route::get('/auths/create', [AuthController::class, 'create'])->name('auths.create');
// Route::post('/auths', [AuthController::class, 'store'])->name('auths.store');
// Route::get('/auths/{auth}', [AuthController::class, 'show'])->name('auths.show');
// Route::get('/auths/{auth}/edit', [AuthController::class, 'edit'])->name('auths.edit');
// Route::put('/auths/{auth}', [AuthController::class, 'update'])->name('auths.update');
// Route::delete('/auths/{auth}', [AuthController::class, 'destroy'])->name('auths.destroy');

Route::prefix('auth')->group(function(){
    Route::apiResource('/auth', AuthController::class)->names('auth');
    Route::post('/login',[AuthController::class, 'login']);
    Route::post('/logout',[AuthController::class, 'logout'])->middleware('auth:api');

    Route::resource('users',UserController::class)->middleware('auth:api');//middleware('auth:api');//->middleware('auth:sanctum');

    //Route::post('me',AuthController::class,'me')->middleware('auth:api');
});
