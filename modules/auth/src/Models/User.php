<?php

namespace Modules\Auth\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements JWTSubject
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


    ];
    protected $primaryKey='id';
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

    // protected static function newFactory(): UserFactory
    // {
    //     // return UserFactory::new();
    // }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
    public function getJWTCustomClaims()
    {
        return[];
    }
    public function papel():BelongsToMany{
        return $this->belongsToMany(Papel::class,'user_papel','user_id','papel_id');
    }

    public function userPapel():HasMany
    {
        return $this->hasMany(UserPapel::class,'user_id','id');

    }
}
