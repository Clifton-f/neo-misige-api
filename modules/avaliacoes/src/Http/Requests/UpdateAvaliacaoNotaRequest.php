<?php

namespace Modules\Avaliacoes\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAvaliacaoNotaRequest extends FormRequest
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
            'cursoId'=>['required','exists:avaliacoes,curso_id'],
            'cadeiraId'=>['required','exists:avaliacoes,cadeira_id'],
            'nomeAvaliacao'=>['required','exists:avaliacoes,nome_avaliacao'],
            'numeroEstudante'=>['required','exists:estudantes,numero_estudante'],
            'nota'=> 'required|between:0,2',
            'ano'=>['required','min:2000','max:3000','exists:avaliacoes,ano','integer'],


        ];
    }


}
