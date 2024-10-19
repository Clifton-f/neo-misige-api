<?php

namespace Modules\Docente\Models;

use Illuminate\Database\Eloquent\Model;

class Nota extends Model
{
    protected $fillable = [
        "curso_id",
        "cadeira_id",
        "ano",
        "estudante_id",
       // "nome_avaliacao",  #Por enquanto mandamos todas avaliacoes de um estudante para cadeira
        "nota"
    ];	

    protected $table = 'avaliacoes_notas'; #TODO nome da tabela foi alterado na ultima versao 
    
    function estudante():BelongsTo {
        return $this->belongsTo(Estdante::class, 'id');
    }
}
