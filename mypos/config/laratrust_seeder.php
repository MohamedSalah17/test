<?php

return [
    'role_structure' => [
        'super_admin' => [
            'doctors' => 'c,r,u,d',
            'students' => 'c,r,u,d',
            'subjects' => 'c,r,u,d',
            'lessons' => 'c,r,u,d',
            'assignments' => 'c,r,u,d',
            'regist' => 'c,r,u,d',
            'admins' => 'c,r,u,d',
            'users' => 'c,r,u,d',
        ],
        'admin' => [
            'doctors' => 'c,r,u,d',
            'students' => 'c,r,u,d',
            'subjects' => 'c,r,u,d',
            'lessons' => 'c,r,u,d',
            'assignments' => 'c,r,u,d',
            'regist' => 'c,r,u,d',
            'admins' => 'c,r,u,d',
            'users' => 'c,r,u,d',
        ],
        'doctor' => [
            'doctors' => 'c,r,u,d',
            'students' => 'c,r,u,d',
            'subjects' => 'c,r,u,d',
            'lessons' => 'c,r,u,d',
            'assignments' => 'c,r,u,d',
            'regist' => 'c,r,u,d',
            'admins' => 'c,r,u,d',
            'users' => 'c,r,u,d',
        ],
        'student' => [
            'doctors' => 'c,r,u,d',
            'students' => 'c,r,u,d',
            'subjects' => 'c,r,u,d',
            'lessons' => 'c,r,u,d',
            'assignments' => 'c,r,u,d',
            'regist' => 'c,r,u,d',
            'admins' => 'c,r,u,d',
            'users' => 'c,r,u,d',
        ],

    ],

    'permissions_map' => [
        'c' => 'create',
        'r' => 'read',
        'u' => 'update',
        'd' => 'delete'
    ]
];
