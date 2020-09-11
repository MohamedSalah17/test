<?php

namespace App\Http\Controllers\Dashboard;

use App\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\Rule;

class StudentController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_students'])->only('index');
        $this->middleware(['permission:create_students'])->only('create');
        $this->middleware(['permission:update_students'])->only('edit');
        $this->middleware(['permission:delete_students'])->only('destroy');

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $students = Student::when($request->search, function ($q) use ($request){
            return $q->where('four_name', 'like', '%'. $request->search . '%')
                    ->orWhere('code', 'like', '%'. $request->search . '%');
        })->latest()->paginate(4);
        return view('dashboard.students.index', compact('students'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.students.create');
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
            'four_name' => 'required',
            'code' => 'required||unique:students',
            'email' => 'required|unique:students',
            'image' => 'image',

            'password' => 'required|confirmed',
            'permissions' => 'required|min:1',

            'phone' => 'required|array|min:1',
            'phone.0' => 'required',

            'address' => 'required',
        ]);

        $request_data = $request->except(['password', 'password_confirmation', 'permissions', 'image']);
        $request_data['password'] = bcrypt($request->password);
        $request_data['phone'] = array_filter($request->phone);

        /*Image Validation
        if($request->image){
            Image::make($request->image)
                ->resize(300, null, function ($constraint) {
                    $constraint->aspectRatio();
            })
            ->save(public_path('uploads/user_images/' .$request->image->hashName()));

            $request_data['image']  =   $request->image->hashName();
        }//end of if
        */

        Student::create($request_data);


        session()->flash('success', __('site.added_successfully'));
        return redirect()->route('dashboard.students.index');
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function edit(Student $student)
    {
        return view('dashboard.students.edit', compact('student'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
        $request->validate([
            'four_name' => 'required',
            'code' => ['required', Rule::unique('students')->ignore($student->id)],
            'email' => ['required', Rule::unique('students')->ignore($student->id)],
            'image' => 'image',
            'permissions' => 'required|min:1',
            'phone' => 'required|array|min:1',
            'phone.0' => 'required',
            'address' => 'required',
        ]);

        $request_data = $request->except(['permissions', 'image']);
        $request_data['phone'] = array_filter($request->phone);

        $student->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->route('dashboard.students.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        $student->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.students.index');
    }
}
