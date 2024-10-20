<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Docente extends Model
{
    protected $table = 'docentes';

    function user(): BelongsTo {
        return $this->belongsTo(User::class, 'id');
    }

}
