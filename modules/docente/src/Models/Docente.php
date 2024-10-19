<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;

class Docente extends Model
{
    protected $table = 'docentes';

    function user(): BelongsTo {
        return $this->belongsTo(User::class, 'id');
    }

}
