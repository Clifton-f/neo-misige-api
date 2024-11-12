<?php

namespace Modules\Cursos\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Catalogo extends Model
{
    //
    protected $table = 'cadeira_curso';
    protected $fillable = [
        'curso_id',
        'cadeira_id',
        'ano',
        'semestre',
        'precedencia',
        "entrou_em_vigor"

    ];
    public $timestamps = false;
    public function curso(): BelongsTo{
        return $this->belongsTo(Curso::class);
    }
    public function cadeira(): BelongsTo{
        return $this->belongsTo(Cadeira::class);
    }
}
