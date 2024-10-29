<?php

namespace Modules\Auth\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
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
        if ($this->method() !== 'PUT') {
            return [
                'nome' =>['required'],
                'email'=>['required','email','unique:users'],
                'BI'=>['required','unique:users'],
                'NUIT'=>['required','unique:users'],
                'contacto_1'=>['sometimes'],
                'papel_id'=>['required','exists:papeis,id'],
                'password'=>['sometimes'],
                'passwordConfirm'=>['sometimes','same:password'],
                'contacto_2'=>['sometimes'],

            ];
        }else{
            return [
                'nome' =>['sometimes','required'],
                'email'=>['sometimes','required','email','unique:users'],
                'BI'=>['sometimes','required','unique:users'],
                'NUIT'=>['sometimes','required','unique:users'],
                'contacto_1'=>['sometimes','required'],
                'papel_id'=>['sometimes','required','exists:papeis,id'],
                'password'=>['sometimes','required'],
                'passwordConfirm'=>['sometimes','required','same:password'],
                'contacto_2'=>['sometimes','required'],

            ];
        }

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
