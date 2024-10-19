<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    protected $table = 'cursos';
    protected $fillable = [
        'id',
        'nome',
        'descricao',
        'departamento_id',
    ];
}
