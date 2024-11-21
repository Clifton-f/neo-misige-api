<?php

namespace Modules\Papel\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePapelRequest extends FormRequest
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
        $method = $this->method();
        if($method=='PUT'){
            return [
                'id'=>['required','integer','exists:papeis,id'],
                'nome'=>['required','unique:papeis'],

            ];
        }else{
            return [
                'id'=>['required','integer','exists:papels,id'],
                'nome'=>['sometimes','required','unique:papeis'],

            ];

        }
        return [
            'nome'=>['required','unique:papeis'],

        ];
    }
}
