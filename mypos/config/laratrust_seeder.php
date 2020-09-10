<?php

return [
    'role_structure' => [
        'super_admin' => [
            'doctors' => 'c,r,u,d',
            'students' => 'c,r,u,d',
            'subjects' => 'c,r,u,d',
            'users' => 'c,r,u,d',
        ],
        'admin' => [],

    ],

    'permissions_map' => [
        'c' => 'create',
        'r' => 'read',
        'u' => 'update',
        'd' => 'delete'
    ]
];
