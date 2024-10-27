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
    public function curso():BelongsTo{
        return $this->belongsTo(Curso::class);
    }
    public function cadeira():BelongsTo{
        return $this->belongsTo(Cadeira::class);
    }
}
