<?php

namespace Modules\Papel\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PapelPermissaoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return false;
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
            'papel_id'=>['bigint(20)','required'],
            'permissao_id'=>['bigint(20)','required']
        ];
    }
}
