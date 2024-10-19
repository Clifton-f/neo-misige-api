<?php

namespace Modules\Matriculas\Models;

use Illuminate\Database\Eloquent\Model;

class Estudante extends Model
{
    //
    protected $table="estudantes";
    protected $fillable=[
        "numero_estudante",
        "ano_entrada",
      "ano_saida"
    ];
    public function curso(){
        return $this->belongsTo(Curso::class,"curso_id","id");
    }
}
