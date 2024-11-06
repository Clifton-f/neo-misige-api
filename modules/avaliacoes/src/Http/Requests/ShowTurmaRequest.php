<?php

namespace Modules\Avaliacoes\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ShowTurmaRequest extends FormRequest
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
            'cursoId' => ['required', 'integer', 'exists:turmas,curso_id'],
            'ano'=> ['sometimes', 'integer', 'exists:turmas,ano'],
            'cadeiraId'=>['sometimes', 'integer', 'exists:turmas,cadeira_id'],
        ];
    }
}
