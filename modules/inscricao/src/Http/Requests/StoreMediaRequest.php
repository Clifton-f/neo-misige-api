<?php

namespace Modules\Inscricao\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Modules\Inscricao\Models\Estudante;

class StoreMediaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
            //"curso_id" => "required|exists:cursos,id",
            "cadeiraId" => "required|exists:cadeiras,id",
            "estudanteId" => "required|exists:estudantes,numero_estudante",

        ];
    }
    public function prepareForValidation(){
        $ano = gmdate('Y');
        $estudante = Estudante::where('id',$this->estudanteId)->first();
//        return $this->merge([
//            "ano"=>$ano,
//            "cadeira_id"=>$this->cadeiraId,
//            "estudante_id"=>$this->estudanteId,
//            "curso_id"=>$estudante->curso_id,
//
//        ]);
    }
}
