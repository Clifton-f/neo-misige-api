<?php

namespace Modules\Cursos\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCatalogoRequest extends FormRequest
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
            "cadeiraId"=>['required', 'integer', 'exists:cadeira,id'],
        "cursoId"=>['required', 'integer', 'exists:curso,id'],
        "ano"=>['required', 'integer', 'min:1', 'max:1'],
        "semestre"=>['required', 'integer', 'min:1', 'max:1'],
            "precedencia"=>['sometimes', 'integer', 'min:1', 'max:1','exists:cadeiras,id'],
        ];
    }
}
