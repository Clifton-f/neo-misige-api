<?php

namespace Modules\Auth\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function authorize()//: bool
    {
        $user = $this->user();
        
        return true;//$user != null;// && ($user->TokenCan('adicionar_estudante') || $user->tokenCan('adicionar_docente'));
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
            'contacto1'=>['required'],
            'papelId'=>['required','exists:papeis,id'],
            'password'=>['required'],
            'passwordConfirm'=>['required','same:password']
            
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
