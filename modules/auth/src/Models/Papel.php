<?php

namespace Modules\Auth\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

// use Modules\Auth\Database\Factories\PapelFactory;

class papel extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'nome',
        'descricao'
    ];
    protected $table = 'papeis';

    public function  permissao():BelongsToMany{
        return $this->belongsToMany(Permissao::class,'papel_permissao','papel_id','permissao_id');
    }
    public function user():BelongsToMany{
        return $this->belongsToMany(User::class,'user_id','papel_id');
    }
    public function userPapel():HasMany{
        return $this->hasMany(UserPapel::class,'papel_id','id');
    }
}

