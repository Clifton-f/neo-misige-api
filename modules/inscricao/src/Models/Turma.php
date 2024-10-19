<?php

namespace Modules\Inscricao\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Turma extends Model
{
    //
    protected $table ="turmas";
    protected $fillable =[
        "curso_id",
        "cadeira_id",
        "ano",
        "regente_id"
    ];
    public function media():HasMany{
        return $this->hasMany(Media::class);
    }
}
