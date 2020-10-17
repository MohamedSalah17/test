<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laratrust\Traits\LaratrustUserTrait;
use Illuminate\Notifications\Notifiable;

class Student extends Model
{
    use LaratrustUserTrait;
    use Notifiable;

    protected $guarded = [];

    /*protected $casts = [
        'phone' => 'array'
    ];*/


    protected $fillable = [
        'name', 'email', 'password','phone', 'address','code'
    ];



    protected $hidden = [
        'password', 'remember_token',
    ];

    /*public function subjects(){
        return $this->belongsToMany(Subject::class,'student_id', 'subject_id')
                                    ->using(StudentSubject::class,'student_id', 'subject_id');
    }*/

    public function stdSbjs(){
        return $this->hasMany(StudentSubject::class,'student_id');
    }

    public function stdAssign(){
        return $this->hasMany(StudentAssignment::class,'student_id');
    }

    /*public function ordersRegits(){
        return $this->hasMany(OrderRegist::class,'student_id','order_id');
    }*/
}
