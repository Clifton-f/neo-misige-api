<?php

namespace Modules\Cursos\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Departamento extends Model
{
    //
    protected $table = 'departamentos';
    protected $fillable = [
        "nome",
        "descricao",
        'faculdade_id'
    ];
    public function curso():HasMany{
        return $this->hasMany(Curso::class);
    }
    public function cadeira():HasMany{
        return $this->hasMany(Cadeira::class);
    }

}
