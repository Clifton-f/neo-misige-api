<?php

namespace Modules\Avaliacoes\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAvaliacaoRequest extends FormRequest
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
            "cadeiraId" => ["required"],//, "exists:avaliacoes,cadeira_id"],
            "cursoId" => ["required"],// "exists:avaliacoes,curso_id"],
            "nomeAvaliacao" => ["required"],// "string", "max:255","exists:avaliacoes,nome_avaliacao"],
            "ano"=>["required"],// "integer", "min:2000", "max:3000"],
            "peso"=>["required"]// "integer", "min:0", "max:100"],
        ];
    }
}
