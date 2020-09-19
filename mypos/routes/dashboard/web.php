
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

            //lesson routes
            Route::resource('lessons', 'LessonController')->except(['show']);
            Route::get('lessons/files/create', 'LessonController@fileCreate');
            //Route::post('lessons/files', 'LessonController@fileStore');

            Route::get('lessons/files/{pdf_file}', 'LessonController@show_pdf');
            Route::get('lessons/files/{powerpoint_file}', 'LessonController@show_pptx');

            Route::get('lessons/file/download/{pdf_file}', 'LessonController@download_pdf');
            Route::get('lessons/file/download/{powerpoint_file}', 'LessonController@download_pptx');


            //lesson routes
            Route::resource('assignments', 'AssignmentController')->except(['show']);

            //student_assignment routes
            Route::resource('student_assignments', 'StudentAssignmentController')->except(['show']);

            //student with subject routes
            Route::resource('student_subjects', 'StudentSubjectController')->except(['show']);
            Route::get('student_subjects/export', 'StudentSubjectController@export')->name('student_subjects.export');
            Route::get('importExportView', 'StudentSubjectController@importExportView');
            Route::post('student_subjects/import', 'StudentSubjectController@import')->name('student_subjects.import');
            /*Route::get('subjects/show-pdf/{id}', function($id) {
                $file = Subject::find($id);
                return response()->file(storage_path($file->path));
            })->name('subjects.show-pdf');*/

            //admin routes
            Route::resource('admins', 'AdminController')->except(['show']);


            //user routes
            Route::resource('users', 'UserController')->except(['show']);




        });//end the dashboard routes

    });




