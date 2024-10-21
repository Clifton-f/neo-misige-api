<?php

namespace Modules\Matriculas\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Modules\Matriculas\Models\Estudante;

class StoreEstudanteRequest extends FormRequest
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
            'curso_id'=>['required','numeric'],
            'contacto_2'=>['sometimes'],
            'data_entrada'=>['required'],
            'numero_estudante'=>['required']
            
        ];
    }

    protected function prepareForValidation()
    {
        $ano = gmdate("Y");
        $numEstudante = (''.$ano.(Estudante::where('numero_estudante','like',(''.$ano.'%'))->count()+1));

            
        $this->merge([
         
            'papel_id'=> $this->papelId,
            'contacto_1'=>$this->contacto1,
            'contacto_2'=>$this->contacto2,
            "curso_id"=>$this->cursoId,
            "papel_id"=>1,
            "data_entrada"=>gmdate("Y-m-d"),
            "numero_estudante"=>$numEstudante
            
            ]);
        }
}
