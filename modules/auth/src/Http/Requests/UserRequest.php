<?php

namespace Modules\Auth\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
            'nome' =>['required'],
            'email'=>['required','email','unique:users'],
            'BI'=>['required','unique:users'],
            'NUIT'=>['required','unique:users'],
            'contacto_1'=>['required'],
            'papel_id'=>['required','exists:papeis,id'],
            'password'=>['required'],
            'passwordConfirm'=>['required','same:password'],
            'contacto_2'=>['sometimes'],

        ];
    }

    protected function prepareForValidation()
    {

        $this->merge([

            'papel_id'=> $this->papelId,
            'contacto_1'=>$this->contacto1,
            'contacto_2'=>$this->contacto2

            ]);
        }
}
