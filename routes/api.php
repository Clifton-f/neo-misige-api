<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\Auth\Http\Controllers\AuthController;
//use Modules\Papel\Http\Controllers\PapelController;
use Modules\Papel\Http\Controllers\PapelController;
use Modules\Auth\Http\Controllers\UserController;
use Modules\Matriculas\Http\Controllers\CursoController;
use Modules\Matriculas\Http\Controllers\EstudanteController;
use Modules\Matriculas\Http\Resources\CadeiraResource;
use Modules\Matriculas\Models\Cadeira;
use Modules\Matriculas\Models\Estudante;
use Modules\Papel\Http\Controllers\PapelPermissaoController;
use Modules\Papel\Http\Controllers\PermissaoController;
use Modules\Papel\Http\Resources\PapelResource;
use Modules\Papel\Models\Papel;
use Modules\Papel\Tests\PapelServiceProviderTest;
use Modules\Docente\Http\Controllers\DocenteController;
use Modules\Docente\Http\Controllers\TurmaController;
use Modules\Docente\Http\Controllers\NotaController;

Route::prefix('auth')->group(function(){
    Route::apiResource('auth', AuthController::class)->names('auth');
    Route::post('login',[AuthController::class, 'login']);
    Route::post('/logout',[AuthController::class, 'logout'])->middleware('auth:api');
    
    Route::resource('users',UserController::class)->middleware('auth:api');//middleware('auth:api');//->middleware('auth:sanctum');

    //Route::post('me',AuthController::class,'me')->middleware('auth:api');    
});

Route::prefix('papel')->group(function(){
    Route::post('login',[AuthController::class, 'login']);
    Route ::apiResource('/papeis', PapelController::class)->middleware('auth:api');
    Route::apiResource('/permissões',PermissaoController::class)->middleware('auth:api');
    Route::post('/addpermissoes',[PapelPermissaoController::class,'store']);
    
});

Route::prefix('docente')->group(function(){
    Route::apiResource('/', DocenteController::class);
    Route::apiResource('/turma', TurmaController::class);
    Route::get("/notaEstudante", [NotaController::class, 'show']);
    Route::get("/notasTurma", [NotaController::class, 'index']);
    //Route::get("/nota/{ano}/{cadeira_id}/{curso_id}/{nome_avaliacao}/{estudante_id}", [NotaController::class, 'show']);
});

Route::prefix('matricula')->group(function(){
    Route::apiResource('curso',CursoController::class);
    Route::get('cadeira',function(){
        return new CadeiraResource(Cadeira::where('id',21)->first());
    });
    Route::apiResource('/estudante',EstudanteController::class);
});