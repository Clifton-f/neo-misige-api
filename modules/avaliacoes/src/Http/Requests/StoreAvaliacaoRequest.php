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
            'cursoId'=>'required',
            'cadeiraId'=>'required',
            'nomeAvaliacao'=>'required',
            'peso'=>['required','numeric','min:1','max:100'],
            'ano'=>['required','numeric','min:2000','max:3000','exists:turmas,ano'],

        ];
    }
}
