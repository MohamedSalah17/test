<?php

namespace App\Http\Controllers\Dashboard;

use App\StudentSubject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Subject;

class StudentSubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $subjects = Subject::all();
        $students = StudentSubject::all();
        $stdSubjects = StudentSubject::when($request->search, function ($q) use ($request){
            return $q->where('id', 'like', '%'. $request->search . '%')
                    ->orWhere('code', 'like', '%'. $request->search . '%');

        })->when($request->sbj_id, function ($q) use ($request){
          return $q->where('subject_id', 'like', '%'. $request->sbj_id . '%');

        })->latest()->paginate(6);

        return view('dashboard.student_subjects.index', compact('subjects','stdSubjects', 'students'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\StudentSubject  $studentSubject
     * @return \Illuminate\Http\Response
     */
    public function show(StudentSubject $studentSubject)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\StudentSubject  $studentSubject
     * @return \Illuminate\Http\Response
     */
    public function edit(StudentSubject $studentSubject)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StudentSubject  $studentSubject
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StudentSubject $studentSubject)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\StudentSubject  $studentSubject
     * @return \Illuminate\Http\Response
     */
    public function destroy(StudentSubject $studentSubject)
    {
        //
    }
}
