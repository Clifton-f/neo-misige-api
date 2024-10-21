<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class Frequencia extends Model
{
    //
    public function avaliacao(){
        return $this->hasMany(Avaliacao::class);
    }
}
