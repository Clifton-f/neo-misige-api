<?php

namespace Modules\Matriculas\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class User extends Model
{
    //
    public function estudante():HasMany{
        return $this->hasMany(Estudante::class);
    }
}
