<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;


class User extends Model
{
       //
    protected $fillable = [
        'nome',
        'email',
        'password',
        'BI',
        'NUIT',
        'contacto_1',
        'contacto_2',
        'papel_id'
    ];
    protected $table='users';
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }


    function docente() : HasOne {
        return $this->hasOne(Docente::class, 'id', 'id');
    }

    function estudante(): HasOne {
        return $this->hasOne(Estudante::class, 'id', 'id');
    }
    // protected static function newFactory(): UserFactory
    // {
    //     // return UserFactory::new();
    // }
}
