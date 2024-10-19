<?php

namespace Modules\Inscricao\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Media extends Model
{
    //
    public function turma():BelongsTo{
        return $this->belongsTo(Turma::class);
    }
}
