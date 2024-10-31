<?php

namespace Modules\Cursos\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Faculdade extends Model
{
    //
    protected $table = 'faculdades';
    protected $fillable = [
        'nome',
        'director'
    ];
    public function departamentos(): HasMany{
        return $this->hasMany(Departamento::class);
    }
}
