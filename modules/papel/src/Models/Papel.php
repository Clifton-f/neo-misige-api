<?php

namespace Modules\Papel\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Papel extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'nome',
        'descricao'
    ];
    protected $table = 'papeis';

    public function  permissao():HasMany{
        return $this->hasMany(PapelPermissao::class,'papel_id','id');
    }
}
