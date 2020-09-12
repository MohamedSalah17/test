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

    protected $casts = [
        'phone' => 'array'
    ];


    protected $fillable = [
        'name', 'email', 'password','phone', 'address','code'
    ];

    protected $appends = ['image_path'];


    protected $hidden = [
        'password', 'remember_token',
    ];

    public function ordersRegits(){
        return $this->hasMany(OrderRegist::class,'student_id','order_id');
    }
}
