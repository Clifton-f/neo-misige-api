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
            "ano"=>"required|exists:turmas,ano",


        ];
    }
    public function messages(): array{
        return [
            "estudante_id.required"=>"O campo estudante é obrigatorio",

        ];
    }
    public function prepareForValidation(){
        return $this->merge([
            "estudante_id"=>$this->estudanteId,

        ]);
    }
}
