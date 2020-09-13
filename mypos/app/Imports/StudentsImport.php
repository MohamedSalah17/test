<?php

namespace App\Imports;

use App\Student;
use App\User;
use Maatwebsite\Excel\Concerns\ToModel;

class StudentsImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Student([
            'name' => $row[0],
            'code' => $row[1],
            'email' => $row[2],
            'password' => bcrypt('123456'),
            'phone' => $row[3],
            'address' => $row[4],
        ]);


    }



}
