<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    //
    public function estudante(){
        return $this->hasMany(Estudante::class);
    }
}
