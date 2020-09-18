<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Assignment extends Model
{
    protected $guarded = [];

    protected $fillable = [
        'name', 'start_date','end_date','lesson_id', 'pdf_quest','pdf_anss'
    ];
    public function lesson(){
        return $this->belongsTo(Lesson::class, 'lesson_id');
    }
}
