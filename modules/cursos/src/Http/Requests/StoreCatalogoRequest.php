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
            "cadeiraId"=>['required', 'integer', 'exists:cadeiras,id'],
        "cursoId"=>['required', 'integer', 'exists:cursos,id'],
        "ano"=>['required', 'integer', 'min:1', 'max:5'],
        "semestre"=>['required', 'integer', 'min:1', 'max:2'],
            "precedencia"=>['sometimes', 'integer','exists:cadeiras,id'],
        ];
    }
}
