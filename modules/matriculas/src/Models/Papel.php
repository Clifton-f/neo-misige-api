<?php

namespace Modules\Matriculas\Models;

use Illuminate\Database\Eloquent\Model;

class Papel extends Model
{
    //
    protected $fillable = [
        'id',
        'nome',
        'descricao'
    ];
    protected $table = 'papeis';
}
