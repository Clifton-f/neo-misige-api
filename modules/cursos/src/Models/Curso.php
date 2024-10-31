<?php

namespace Modules\Cursos\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Curso extends Model
{
    //
    protected $table = 'cursos';
    protected $fillable = [
        "nome",
        "descricao",
        'duracao_minima',
        "duracao_maxima",
        'departamento_id',
    ];
    public function departamento():BelongsTo{
        return $this->belongsTo(Departamento::class);
    }
    public function catalogos():HasMany
    {
        return $this->hasMany(Catalogo::class);
    }
}
