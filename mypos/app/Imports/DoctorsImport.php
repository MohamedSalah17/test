<?php

namespace App\Imports;

use App\Doctor;
use App\User;
use Maatwebsite\Excel\Concerns\ToModel;

class DoctorsImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $docs = Doctor::create([
            'name' => $row[0],
            'username' => $row[1],
            'email' => $row[2],
            'password' => bcrypt('123456'),
            'phone' => $row[3],
            'active' => $row[4],
            'account_confirm' => $row[5],
        ]);
        $docref = $docs->refresh();
        User::create([
            'name' => $row[0],
            'username' => $row[1],
            'email' => $row[2],
            'password' => bcrypt('123456'),
            'phone' => $row[3],
            'active' => $row[4],
            'account_confirm' => $row[5],
            'type' =>'doctor',
            'fid' => $docref->id
        ]);
        return $docs;
    }
}
