<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class Turma extends Model
{
    //
    public function docente(){
        return $this->hasMany(Docente::class);
    }
}
