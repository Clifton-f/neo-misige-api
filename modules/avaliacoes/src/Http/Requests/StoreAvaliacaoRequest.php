<?php

namespace Modules\Avaliacoes\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAvaliacaoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return false;
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
            'curso_id'=>'required',
            'cadeira_id'=>'required',
            'nome_avaliacao'=>'required',
            'peso'=>'required'

        ];
    }
    protected function prepareForValidation()
    {
        $ano=
        
        $this->merge([
            "curso_id"=>'cursoId',
            'cadeira_id'=>'cadeiraId',
            'nome_avaliacao'=>'nomeAvaliacao',
            "ano"=>gmdate("Y")
            

        ]);
    }
}
