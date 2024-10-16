<?php

namespace Modules\Papel\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

use Illuminate\Database\Eloquent\Model;

class Permissao extends Model
{
    //
    use HasFactory;
    protected $table='permissoes';
    protected $fillable = [
        'id',
        'nome',
        'descricao'
    ];

    public function papelPermissao():HasMany{

        return $this->hasMany(PapelPermissao::class,'permissao_id','id');
    }
    

}
