<?php
use Illuminate\Support\Facades\Route;
use Modules\Certificado\Http\Controllers\CertificadoController;

Route::prefix('certificado')->group(function () {
    Route::post("/cadeirasfeitas",[CertificadoController::class,'mostrarConclusaoCurso']);
});
