<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;

class Turma extends Model
{
    protected $table = 'turmas';

    protected $fillable = [
        'curso_id',
        'cadeira_id',
        'ano',
        'regente_id'
    ];
}
