<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;

class Cadeira extends Model
{
    protected $table = 'cadeiras';
    protected $fillable = [
        'id',
        'nome',
        'departamento_id'
    ];
}
