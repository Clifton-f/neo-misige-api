<?php

namespace Modules\Matriculas\Models;

use Illuminate\Database\Eloquent\Model;

class UserPapel extends Model
{
    //
    protected $table = 'user_papel';
    protected $fillable = ['user_id', 'papel_id'];
}
