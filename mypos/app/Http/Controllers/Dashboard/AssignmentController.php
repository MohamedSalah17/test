<?php

namespace App\Http\Controllers\Dashboard;

use App\Assignment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Lesson;

class AssignmentController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_assignments'])->only('index');
        $this->middleware(['permission:create_assignments'])->only('create');
        $this->middleware(['permission:update_assignments'])->only('edit');
        $this->middleware(['permission:delete_assignments'])->only('destroy');

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $lessons = Lesson::all();
        $assignments = Assignment::when($request->search, function ($q) use ($request){
            return $q->where('name', 'like', '%'. $request->search . '%');

        })->when($request->lesson_id, function ($q) use ($request){
          return $q->where('lesson_id', 'like', '%'. $request->lesson_id . '%');

        })->latest()->paginate(6);

        return view('dashboard.assignments.index', compact('assignments','lessons'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $lessons = Lesson::all();
        return view('dashboard.assignments.create', compact('lessons'));
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
     * @param  \App\Assignment  $assignment
     * @return \Illuminate\Http\Response
     */
    public function show(Assignment $assignment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Assignment  $assignment
     * @return \Illuminate\Http\Response
     */
    public function edit(Assignment $assignment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Assignment  $assignment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Assignment $assignment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Assignment  $assignment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Assignment $assignment)
    {
        //
    }
}
