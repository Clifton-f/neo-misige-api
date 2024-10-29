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

            'curso_id' => 'required|exists:cursos,id',
            'ano'=>'required:exists:turmas,ano',
            'cadeira_id'=>'required:exists:cadeiras,id',
            'nome_avaliacao'=>'required:exists:avaliacoes,nome_avaliacao',

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
