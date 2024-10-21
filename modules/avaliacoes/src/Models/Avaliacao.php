<?php

namespace Modules\Avaliacoes\Models;

use Illuminate\Database\Eloquent\Model;

class Avaliacao extends Model
{
    //
    protected $table = "avaliacoes";
    protected $fillable=[
        "curso_id",
        "cadeira_id","ano",
        "nome_avaliacao",
        "peso",
        "exame_normal","exame_recorrencia"

    ];
    public function avaliacaoNota(){
        return $this->hasMany('AvaliacaoNota',['curso_id','cadeira_id','ano','nome_avaliacao'],['curso_id','cadeira_id','ano','nome_avaliacao']);
    }
    public function frequencia(){
        return $this->belongsTo(Frequencia::class);
    }
}
