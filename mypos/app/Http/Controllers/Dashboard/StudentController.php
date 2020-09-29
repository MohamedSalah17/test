<?php

namespace App\Http\Controllers\Dashboard;

use App\Exports\StudentsExport;
use App\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Imports\StudentsImport;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;

class StudentController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_students'])->only('index');
        $this->middleware(['permission:create_students'])->only('create');
        $this->middleware(['permission:update_students'])->only('edit');
        $this->middleware(['permission:delete_students'])->only('destroy');

    }

    public function importExportView()
    {
       return view('dashboard.students.index');
    }

    public function export()
    {
        return Excel::download(new StudentsExport, 'students.xlsx');
    }

    public function import()
    {
        Excel::import(new StudentsImport,request()->file('file'));

        return back();
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $students = Student::when($request->search, function ($q) use ($request){
            return $q->where('name', 'like', '%'. $request->search . '%')
                    ->orWhere('code', 'like', '%'. $request->search . '%');
        })->latest()->paginate(6);
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
            'name' => 'required',
            'code' => 'required||unique:students',
            'email' => 'required|unique:students',

            'password' => 'required|confirmed',
            //'permissions' => 'required|min:1',

            'phone' => 'required|array|min:1',
            'phone.0' => 'required',

            'address' => 'required',
        ]);

        $request_data = $request->except(['password', 'password_confirmation', 'permissions']);
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

        $student = Student::create($request_data);
        $student->attachRole('student');
        //$student->syncPermissions($request->permissions);

        //add doctor to user table
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'type'  =>  'student',

            'password' => 'required|confirmed',
            //'permissions' => 'required|min:1',

        ]);
        $request_data = $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);
        $request_data['type'] = 'student';
        $request_data['fid']  = $student->id;


        $user = User::create($request_data);
        $user->attachRole('student');
        //$user->syncPermissions($request->permissions);


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
    public function update(Request $request, Student $student, User $user)
    {
        $request->validate([
            'name' => 'required',
            'code' => ['required', Rule::unique('students')->ignore($student->id)],
            'email' => ['required', Rule::unique('students')->ignore($student->id)],
            'phone' => 'required|array|min:1',
            'phone.0' => 'required',
            'address' => 'required',
        ]);

        $request_data = $request->except(['permissions']);
        $request_data['phone'] = array_filter($request->phone);

        $student->update($request_data);

        //update student in user table
        $request->validate([
            'name' => 'required',
            //'last_name' => 'required',
            'email' => 'required',
        ]);

        $uid = DB::select("SELECT id FROM users  WHERE email = ?", [$student->email]);
        $user->id = $uid;

        $request_data= $request->except(['permissions']);
        $user->update($request_data);

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
