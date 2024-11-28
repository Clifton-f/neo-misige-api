<?php

namespace Modules\Docente\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ShowNotasTurmaRequest extends FormRequest
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

            'cursoId' => 'required|exists:cursos,id',
            'ano'=>'required:exists:turmas,ano',
            'cadeiraId'=>'required:exists:cadeiras,id',
            'nomeAvaliacao'=>'sometimes:exists:avaliacoes,nome_avaliacao',

        ];
    }
    public function prepareForValidation()
    {
        return $this->merge([
            'curso_id'=>$this->cursoId,
            'cadeira_id'=>$this->cadeiraId,
            'nome_avaliacao'=>$this->nomeAvaliacao


        ]);
    }
}
