<?php

namespace Modules\Certificado\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Estudante extends Model
{
    //
    public $table = 'estudantes';
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class,'id','id');
    }
}
