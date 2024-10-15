<?php

namespace Modules\Auth\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
// use Modules\Auth\Database\Factories\PapelFactory;

class papel extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome',
        'descricao'
    ];
    protected $table = 'papeis';

    public function  permissao():BelongsToMany{
        return $this->belongsToMany(Permissao::class,'papel_permissao','papel_id','permissao_id');
    }
}

