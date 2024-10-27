<?php

namespace Modules\Inscricao\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ShowMediaRequest extends FormRequest
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
            "estudante_id" => "required|exists:estudantes,id",
            "curso_id" => "required|exists:cursos,id",
            "cadeira_id" => "required|exists:cadeira,id",
        ];
    }
    public function messages(): array{
        return [
            "estudante_id.required"=>"O campo estudante é obrigatorio",
            "curso_id.require"=>"O campo curso é obrigatorio",
        ];
    }
}
