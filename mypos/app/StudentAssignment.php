<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentAssignment extends Model
{
    protected $guarded = [];

    protected $fillable = [
        'assign_id', 'student_id','pdf_anss'
    ];

    public function assignments(){
        return $this->belongsTo(Assignment::class,'assign_id');
    }

    public function students(){
        return $this->belongsTo(Student::class,'student_id');
    }
}
