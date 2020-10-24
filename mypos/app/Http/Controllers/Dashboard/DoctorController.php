<?php

namespace App\Http\Controllers\Dashboard;

use App\Doctor;
use App\Exports\DoctorsExport;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Imports\DoctorsImport;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;


class DoctorController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_doctors'])->only('index');
        $this->middleware(['permission:create_doctors'])->only('create');
        $this->middleware(['permission:update_doctors'])->only('edit');
        $this->middleware(['permission:delete_doctors'])->only('destroy');

    }

    public function importExportView()
    {
       return view('dashboard.doctors.index');
    }

    public function export()
    {
        return Excel::download(new DoctorsExport, 'doctors.xlsx');
    }

    public function import()
    {
        Excel::import(new DoctorsImport,request()->file('file'));

        return back();
    }

    public function index(Request $request)
    {
        $doctors = Doctor::when($request->search, function ($q) use ($request){
            return $q->where('name', 'like', '%'. $request->search . '%');
        })->latest()->paginate(6);

        return view('dashboard.doctors.index', compact('doctors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.doctors.create');
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
            'email' => 'required|unique:doctors',
            'username' => 'required|unique:doctors',
            'phone' => 'required|unique:doctors',

            'password' => 'required|confirmed',
            //'permissions' => 'required|min:1',

            'active' => 'required',
        ]);

        $request_data = $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);
        //$request_data['phone'] = array_filter($request->phone);

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

        $doctor = Doctor::create($request_data);
        $doctor->attachRole('doctor');
        /*$doctor->attachPermission('read_students','read_subjects'
                ,'create_lessons','read_lessons', 'edit_lessons','delete_lessons',
                'create_assignments','read_assignments', 'edit_assignments','delete_assignments',
                'read_regist','read_stdassign');*/
        //$doctor->syncPermissions($request->permissions);

        //add doctor to user table
         $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'username' => 'required|unique:users',
            'phone' => 'required|unique:users',
            'type'  =>  'doctor',
            'active' => 'required',

            'password' => 'required|confirmed',
            //'permissions' => 'required|min:1',

        ]);
        $request_data = $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);
        //dd($doctor->id);
        $request_data['type'] = 'doctor';
        $request_data['fid']  = $doctor->id;

        $user = User::create($request_data);
        $user->attachRole('doctor');
        /*$user->attachPermission('read_students','read_subjects'
        ,'create_lessons','read_lessons', 'edit_lessons','delete_lessons',
        'create_assignments','read_assignments', 'edit_assignments','delete_assignments',
        'read_regist','read_stdassign');*/
        //$user->syncPermissions($request->permissions);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->route('dashboard.doctors.index');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Doctor  $doctor
     * @return \Illuminate\Http\Response
     */
    public function edit(Doctor $doctor)
    {
        return view('dashboard.doctors.edit',compact('doctor'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Doctor  $doctor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Doctor $doctor, User $user)
    {
        $request->validate([
            'name' => 'required',
            'email' => ['required', Rule::unique('doctors')->ignore($doctor->id)],
            'username' => ['required', Rule::unique('doctors')->ignore($doctor->id)],
            'phone' => ['required', Rule::unique('doctors')->ignore($doctor->id)],
            'active' => 'required',
        ]);

        $request_data = $request->except(['permissions']);
        //$request_data['phone'] = array_filter($request->phone);

        $doctor->update($request_data);

        //update doctor in user table
        $request->validate([
            'name' => 'required',
            //'last_name' => 'required',
            'email' => 'required',
            //'username' => ['required',Rule::unique('users')->ignore($user->id)],
            'phone' => 'required',
            'active' => 'required',

        ]);

        $users = User::all();
        foreach ($users as $user) {
            if($user->fid == $doctor->id && $user->type == 'doctor'){
                $request_data= $request->except(['permissions']);
                $user->update($request_data);
            }
        }

        //$user->id = $doctor->id;



        session()->flash('success', __('site.updated_successfully'));
        return redirect()->route('dashboard.doctors.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Doctor  $doctor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Doctor $doctor)
    {
        $users = User::all();
        foreach ($users as $user) {
            if($user->fid == $doctor->id){
                $user->delete();
            }
        }
        $doctor->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.doctors.index');
    }
}
