<?php

namespace Modules\Certificado\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Laravel\Sanctum\Contracts\HasAbilities;

class User extends Model
{
    //
    public function estudante():HasOne
    {
        return $this->hasOne(Estudante::class,'id','id');

    }
}
