<?php

namespace Modules\Auth\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
// use Modules\Auth\Database\Factories\PermissaoFactory;

class Permissao extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $table = 'permissoes';
    use HasFactory;
    public function papel():BelongsToMany{
        return $this->belongsToMany(Papel::class,'papel_permissao','permissao_id','papel_id');
    }
    
}