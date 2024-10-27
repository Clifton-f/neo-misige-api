<?php

namespace Modules\Inscricao\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Curso extends Model
{
    //
    public function media():hasMany
    {
        return $this->hasMany(Media::class);
    }
}
