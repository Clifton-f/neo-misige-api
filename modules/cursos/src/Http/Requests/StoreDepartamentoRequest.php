<?php

namespace Modules\Cursos\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreDepartamentoRequest extends FormRequest
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
            'nome' => ['required', 'string','max:255'],
            'descricao' => ['nullable', 'string','max:255'],
            'faculdadeId'=>['required', 'integer', 'exists:faculdades,id'],

        ];
    }
    public function messages(): array{
        return [
            'nome'=>'Nome é obrigatório'
        ];
    }
    public function attributes()
    {
        return [
            'nome' => 'Nome do Departamento',
        ];
    }
}
