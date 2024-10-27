<?php

namespace Modules\Matriculas\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class User extends Model
{
    //

    protected $fillable = [
        'nome',
        'id',
        'email',
        'password',
        'BI',
        'NUIT',
        'contacto_1',
        'contacto_2',


    ];
protected $table='users';


    public function estudante():HasMany{
        return $this->hasMany(Estudante::class);
    }
}
