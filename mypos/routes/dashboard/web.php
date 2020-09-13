
<?php

Route::group(['prefix' => LaravelLocalization::setLocale(),'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]],
    function() {
        Route::prefix('dashboard')->name('dashboard.')->middleware(['auth'])->group(function(){

            Route::get('/index', 'WelcomeController@index')->name('index');

            //doctor routes
            Route::resource('doctors', 'DoctorController')->except(['show']);

            //student routes
            Route::resource('students', 'StudentController')->except(['show']);
            Route::resource('students.ordersRegist', 'Student\OrderRegistController')->except(['show']);
            Route::get('students/export', 'StudentController@export')->name('students.export');
            Route::get('importExportView', 'StudentController@importExportView');
            Route::post('students/import', 'StudentController@import')->name('students.import');

            //user routes
            Route::resource('subjects', 'SubjectController')->except(['show']);
            Route::get('subjects/export', 'SubjectController@export')->name('subjects.export');
            Route::get('importExportView', 'SubjectController@importExportView');
            Route::post('subjects/import', 'SubjectController@import')->name('subjects.import');

            //user routes
            Route::resource('users', 'UserController')->except(['show']);



        });//end the dashboard routes

    });




