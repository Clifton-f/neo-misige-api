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
            'estudanteId'=>['required','exists:avaliacao_nota,estudante_id'],
            'nota'=>['required','min:0','max:20'],
            'ano'=>['required','min:2000','max:3000','exists:avaliacoes,ano','integer'],


        ];
    }

}
