<?php

namespace App\Http\Controllers\Dashboard;

use App\Lesson;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Subject;

class LessonController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_lessons'])->only('index');
        $this->middleware(['permission:create_lessons'])->only('create');
        $this->middleware(['permission:update_lessons'])->only('edit');
        $this->middleware(['permission:delete_lessons'])->only('destroy');

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $subjects = Subject::all();
        $lessons = Lesson::when($request->search, function ($q) use ($request){
            return $q->where('name', 'like', '%'. $request->search . '%');

        })->when($request->sbj_id, function ($q) use ($request){
          return $q->where('sbj_id', 'like', '%'. $request->sbj_id . '%');

        })->latest()->paginate(6);

        return view('dashboard.lessons.index', compact('lessons','subjects'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $subjects = Subject::all();
        return view('dashboard.lessons.create', compact('subjects'));
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
     * @param  \App\Lesson  $lesson
     * @return \Illuminate\Http\Response
     */
    public function show(Lesson $lesson)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Lesson  $lesson
     * @return \Illuminate\Http\Response
     */
    public function edit(Lesson $lesson)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Lesson  $lesson
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Lesson $lesson)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Lesson  $lesson
     * @return \Illuminate\Http\Response
     */
    public function destroy(Lesson $lesson)
    {
        //
    }
}
