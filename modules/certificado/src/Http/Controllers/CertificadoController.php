<?php

namespace Modules\Certificado\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Certificado\Http\Requests\ShowCertificadoRequest;
use Modules\Certificado\Http\Resources\EstudanteResource;
use Modules\Certificado\Models\Estudante;

class CertificadoController
{
    //
    public function show(ShowCertificadoRequest $request){
        $campos = $request->validated();
        $estudante = Estudante::where('numero_estudante',$campos['numeroEstudante'])->first();

        return new EstudanteResource($estudante);
    }

    public function mostrarConclusaoCurso(ShowCertificadoRequest $request)
    {
        $campos = $request->validated();
        $estudante = Estudante::where('numero_estudante',$campos['numeroEstudante'])->first();
        $resource = new EstudanteResource($estudante);
        return $resource->listarCadeirasFeitas();
    }
}
