<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class Estudante extends Model
{
    //
    public function user(){
        return $this->belongsTo(User::class);
    }
}
