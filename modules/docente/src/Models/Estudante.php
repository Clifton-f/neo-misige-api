<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;

class Estudante extends Model
{
    protected $table = 'estudantes';

    protected $fillable = [
        'numero_estundante',
        'id',
        'curso_id',
        'data_entrada',
        'data_saida'
    ];
    
    function user(): BelongsTo {
        return $this->belongsTo(User::class);
    }
}

