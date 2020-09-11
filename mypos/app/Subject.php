<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    protected $guarded = [];

    protected $fillable = [
        'name', 'code','doc_id',
    ];

    public function doctor(){
        return $this->belongsTo(Doctor::class, 'doc_id');
    }
}
