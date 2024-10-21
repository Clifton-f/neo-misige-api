<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class Docente extends Model
{
    //
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function turma(){
        return $this->belongsTo(Turma::class);
    }
}
