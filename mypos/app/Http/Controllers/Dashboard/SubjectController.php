<?php

namespace App\Http\Controllers\Dashboard;

use App\Doctor;
use App\Subject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\Rule;

class SubjectController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_subjects'])->only('index');
        $this->middleware(['permission:create_subjects'])->only('create');
        $this->middleware(['permission:update_subjects'])->only('edit');
        $this->middleware(['permission:delete_subjects'])->only('destroy');

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $doctors = Doctor::all();
        $subjects = Subject::when($request->search, function ($q) use ($request){
            return $q->where('name', 'like', '%'. $request->search . '%')
                    ->orWhere('code', 'like', '%'. $request->search . '%');

        })->when($request->doc_id, function ($q) use ($request){
          return $q->where('doc_id', 'like', '%'. $request->doc_id . '%');

        })->latest()->paginate(4);

        return view('dashboard.subjects.index', compact('subjects','doctors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $doctors = Doctor::all();
        return view('dashboard.subjects.create', compact('doctors'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:subjects',
            'code' => 'required|unique:subjects',
            'doc_id' => 'required',
        ]);

        $request_data = $request->all();

        Subject::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->route('dashboard.subjects.index');
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Subject  $subject
     * @return \Illuminate\Http\Response
     */
    public function edit(Subject $subject)
    {
        return view('dashboard.subjects.edit', compact('subject'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Subject  $subject
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Subject $subject)
    {
        $request->validate([
            'name' => ['required', Rule::unique('subjects')->ignore($subject->id)],
            'code' => ['required', Rule::unique('subjects')->ignore($subject->id)],
            'sbj_doc' => 'required',
        ]);

        $request_data = $request->all();

        $subject->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->route('dashboard.subjects.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Subject  $subject
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subject $subject)
    {
        $subject->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.subjects.index');
    }
}
