<?php

use Modules\Auth\Http\Controllers\AuthController;
use Modules\Papel\Http\Controllers\PapelController;
use Modules\Papel\Http\Controllers\PermissaoController;
use Illuminate\Support\Facades\Route;

// Route::get('/papels', [PapelController::class, 'index'])->name('papels.index');
// Route::get('/papels/create', [PapelController::class, 'create'])->name('papels.create');
// Route::post('/papels', [PapelController::class, 'store'])->name('papels.store');
// Route::get('/papels/{papel}', [PapelController::class, 'show'])->name('papels.show');
// Route::get('/papels/{papel}/edit', [PapelController::class, 'edit'])->name('papels.edit');
// Route::put('/papels/{papel}', [PapelController::class, 'update'])->name('papels.update');
// Route::delete('/papels/{papel}', [PapelController::class, 'destroy'])->name('papels.destroy');

Route::prefix('papel')->group(function(){
    Route::post('login',[AuthController::class, 'login']);
    Route ::apiResource('/papeis', PapelController::class)->middleware('auth:api');
    Route::apiResource('/permissoes',PermissaoController::class)->middleware('auth:api');
    Route::post('/addpermissoes',[PapelPermissaoController::class,'store']);

});
