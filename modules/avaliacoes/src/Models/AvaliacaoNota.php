<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class AvaliacaoNota extends Model
{
    //

    protected $table = 'avaliacao_nota';
    public function avaliacao(){
        return $this->belongsTo('Avaliacao',['curso_id','cadeira_id','ano','nome_avaliacao'],['curso_id','cadeira_id','ano','nome_avaliacao']);
    }

    public function estudante(){
        return $this->belongsTo(Estudante::class);
    }
}
