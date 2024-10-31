<?php

namespace Modules\Cursos\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cadeira extends Model
{
    //
    protected $table = 'cadeiras';
    protected $fillable = [
        'nome',
        'descricao',
        'departamento_id',

    ];
    public function departamentos():BelongsTo{
        return $this->belongsTo(Departamento::class);
    }
    public function cursos():HasMany{
        return $this->hasMany(Curso::class);
    }

}
