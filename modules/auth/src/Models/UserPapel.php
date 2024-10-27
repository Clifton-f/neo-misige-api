<?php

namespace Modules\Auth\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserPapel extends Model
{
    //
    protected $table = 'user_papel';
    public function user(): BelongsTo{
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function papel(): BelongsTo{
        return $this->belongsTo(Papel::class,'papel_id','id');
    }
}
