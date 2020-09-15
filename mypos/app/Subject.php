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

    public function lessons(){
        return $this->hasMany(Lesson::class, 'sbj_id');
    }

    public function ordersRegist(){
        return $this->belongsToMany(OrderRegist::class,'subject_id','order_id');
    }
}
