<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laratrust\Traits\LaratrustUserTrait;
use Illuminate\Notifications\Notifiable;


class Doctor extends Model
{
    use LaratrustUserTrait;
    use Notifiable;

    protected $guarded = [];

    protected $casts = [
        'phone' => 'array'
    ];


    protected $fillable = [
        'name', 'email', 'password','phone', 'address'
    ];

    protected $appends = ['image_path'];


    protected $hidden = [
        'password', 'remember_token',
    ];
}
