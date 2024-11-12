<?php

use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Modules\Auth\Http\Controllers\AuthController;
//use Modules\Papel\Http\Controllers\PapelController;
use Modules\Cursos\Http\Controllers\CadeiraController;
use Modules\Cursos\Http\Controllers\DepartamentoController;
use Modules\Cursos\Http\Controllers\FaculdadeController;
use Modules\Papel\Http\Controllers\PapelController;
use Modules\Auth\Http\Controllers\UserController;
use Modules\Matriculas\Http\Controllers\CursoController;
use Modules\Cursos\Http\Controllers\CursoController as CursoControllerCursos;
use Modules\Cursos\Http\Controllers\CadeiraController as CadeiraControllerCursos;
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
use \Modules\Inscricao\Http\Controllers\MediaController;
use \Modules\Inscricao\Http\Controllers\AvaliacaoController;
use \Modules\Certificado\Http\Controllers\CertificadoController;
use \Modules\Cursos\Http\Controllers\CatalogoController;
use Modules\Avaliacoes\Http\Controllers\AvaliacaoNotaController;
use Modules\Avaliacoes\Http\Controllers\AvaliacaoController as AvaliacaoControlerAvaliacao;
use Illuminate\Support\Facades\Http;
use \Modules\Avaliacoes\Http\Controllers\TurmaController as AvaliacaoTurmaController;
$routes=0;
$dirs = scandir($path=base_path('modules'));
for($i=2;$i<count($dirs);$i++) {
    $filepath = "{$path}/{$dirs[$i]}/routes/api.php";
    if(file_exists($filepath)) {
       require $filepath;
    }


}
$mediaController = new MediaController();
//Route::prefix('auth')->group(function(){
//    Route::apiResource('/auth', AuthController::class)->names('auth');
//    Route::post('/login',[AuthController::class, 'login']);
//    Route::post('/logout',[AuthController::class, 'logout'])->middleware('auth:api');
//
//    Route::resource('users',UserController::class)->middleware('auth:api');//middleware('auth:api');//->middleware('auth:sanctum');
//
//    //Route::post('me',AuthController::class,'me')->middleware('auth:api');
//});

//Route::prefix('papel')->group(function(){
//    Route::post('login',[AuthController::class, 'login']);
//    Route ::apiResource('/papeis', PapelController::class)->middleware('auth:api');
//    Route::apiResource('/permissoes',PermissaoController::class)->middleware('auth:api');
//    Route::post('/addpermissoes',[PapelPermissaoController::class,'store']);
//
//});
//
//Route::prefix('docente')->group(function(){
//    Route::apiResource('/docentes', DocenteController::class);
//    Route::apiResource('/turmas', TurmaController::class);
//    Route::post("/notaestudante", [NotaController::class, 'show']);
//    Route::post("/notasturma", [NotaController::class, 'index']);
//    //Route::get("/nota/{ano}/{cadeira_id}/{curso_id}/{nome_avaliacao}/{estudante_id}", [NotaController::class, 'show']);
//});

//Route::prefix('matricula')->group(function(){
//    Route::get('cursos',[CursoController::class,'index']);
//    Route::get('cadeira',function(){
//        return new CadeiraResource(Cadeira::where('id',21)->first());
//    });
//    Route::apiResource('/estudantes',EstudanteController::class);
//});
Route::prefix('inscricao')->group(function(){
    Route::apiResource('/inscricoes',MediaController::class);

    Route::controller(MediaController::class)->group(function(){
        Route::post('cadeiras',"cadeiras");

    });
});
//Route::prefix('avaliacao')->group(function(){
//    Route::patch('/lancarnota',[AvaliacaoNotaController::class,'update']);
//    Route::post('/adicionaravaliacao',[AvaliacaoControlerAvaliacao::class,'store']);
//    Route::put('/editarpesoavaliacao',[AvaliacaoControlerAvaliacao::class,'editarPeso']);
//    Route::post('/veravaliacao',[AvaliacaoControlerAvaliacao::class,'show']);
//    Route::post('/veravaliacoesturma',[AvaliacaoControlerAvaliacao::class,'index']);
//    Route::post('/veravaliacoescurso',[AvaliacaoControlerAvaliacao::class,'index']);
//    Route::delete('eliminaravaliacao',[AvaliacaoControlerAvaliacao::class,'destroy']);
//    Route::post('/veranos',[AvaliacaoTurmaController::class,'anosActivo']);
//
//    Route::post('/verturmas',[AvaliacaoTurmaController::class,'showTurmas']);
//
//});

//Route::prefix('curso')->group(function(){
//    Route::apiResource('/cursos',CursoControllerCursos::class);
//    Route::apiResource('/cadeiras',CadeiraControllerCursos::class);
//    Route::apiResource('/departamentos',DepartamentoController::class);
//    Route::post('/catalogo',[CatalogoController::class,'store']);
//    Route::apiResource('/faculdades',FaculdadeController::class);
//});


Route::get('certificado',[CertificadoController::class,'show']);
Route::get('remote',function(Request $request){
    $client = new Client();
    $uri = 'https://api.econlab.co.mz/api/certificado?numeroEstudante='.$request->input('studentNumber');

    //$response = $client->request('GET',$uri);
    $response = Http::Get($uri);
   return json_decode($response->getBody());
});

