<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderRegist extends Model
{
    protected $guarded=[];
    //protected $casts = ['subjects' => 'array'];

    public function student(){
        return $this->belongsTo(Student::class,'student_id','order_id');
    }

    public function subjects(){
        return $this->belongsToMany(Subject::class,'subject_id','order_id');

    }
}
