<?php

namespace Modules\Cursos\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCursoRequest extends FormRequest
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
            'nome' => ['required', 'string', 'max:255'],
            'descricao' => ['nullable', 'string', 'max:1000'],
            'duracaoMinima' => ['required', 'numeric'],
            'duracaoMaxima' => ['required', 'numeric'],
            'departamentoId' => ['required', 'exists:departamentos,id'],
        ];
    }
    //public function prepareForValidation(){
    //    return $this->merge([
    //        'duracao_minima' => $this->duracaoMinima,
    //        'duracao_maxima'=> $this->duracaoMaxima
    //    ]);
    //}
    public function messages(): array{
        return [
            'duracao_maxima.reqired'=>'O campo duracao maxima deve ser preenchido',
        ];
    }
}
