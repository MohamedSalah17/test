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
        $stds = Student::create([
            'name' => $row[0],
            'username' => $row[1],
            'level_id' => $row[2],
            'department_id' => $row[3],
            'code' => $row[4],
            'email' => $row[5],
            'password' => bcrypt('123456'),
            'phone' => $row[6],
            'set_number' => $row[7],
            'national_id' => $row[8],
            'active' => $row[9],
            'account_confirm' => $row[10],
            'graduated' => $row[11],
            'can_see_result' => $row[12],
        ]);
       $stdref = $stds->refresh();

         User::create([
            'name' => $row[0],
            'username' => $row[1],
            'email' => $row[5],
            'password' => bcrypt('123456'),
            'phone' => $row[6],
            'active' => $row[9],
            'account_confirm' => $row[10],
            'type' =>'student',
            'fid' => $stdref->id
        ]);

        return $stds;




    }



}
