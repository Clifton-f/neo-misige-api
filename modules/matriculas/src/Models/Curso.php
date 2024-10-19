<?php

namespace Modules\Matriculas\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Curso extends Model
{
    //
    protected $table="cursos";
    protected $fillable=[
      "id",
      "nome" ,
      "descricao",
      "departamento_id"
    ];
    public function estudante():HasMany{
        return $this->hasMany(Estudante::class,"curso_id","id");
    }
}
