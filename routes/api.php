<?php

use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
//use \Modules\Inscricao\Http\Controllers\AvaliacaoController;
use \Modules\Certificado\Http\Controllers\CertificadoController;
use Illuminate\Support\Facades\Http;



//carrega os roteadores dos módulos
$dirs = scandir($path=base_path('modules'));
for($i=2;$i<count($dirs);$i++) {
    $filepath = "{$path}/{$dirs[$i]}/routes/api.php";
    if(file_exists($filepath)) {
       require $filepath;
    }


}



Route::get('certificado',[CertificadoController::class,'show']);
Route::get('remote',function(Request $request){
    $client = new Client();
    $uri = 'https://api.econlab.co.mz/api/certificado?numeroEstudante='.$request->input('studentNumber');

    //$response = $client->request('GET',$uri);
    $response = Http::Get($uri);
   return json_decode($response->getBody());
});

