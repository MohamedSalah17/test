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
            'username' => $row[1],
            'code' => $row[2],
            'email' => $row[3],
            'password' => bcrypt('123456'),
            'phone' => $row[4],
            'active' => $row[5],
            'account_confirm' => $row[6],
        ]);


    }



}
