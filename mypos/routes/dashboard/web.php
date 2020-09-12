
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

            //user routes
            Route::resource('subjects', 'SubjectController')->except(['show']);

            //user routes
            Route::resource('users', 'UserController')->except(['show']);



        });//end the dashboard routes

    });




