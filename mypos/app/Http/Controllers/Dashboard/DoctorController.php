<?php

namespace App\Http\Controllers\Dashboard;

use App\Doctor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Validation\Rule;

class DoctorController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_doctors'])->only('index');
        $this->middleware(['permission:create_doctors'])->only('create');
        $this->middleware(['permission:update_doctors'])->only('edit');
        $this->middleware(['permission:delete_doctors'])->only('destroy');

    }

    public function index(Request $request)
    {
        $doctors = Doctor::when($request->search, function ($q) use ($request){
            return $q->where('name', 'like', '%'. $request->search . '%');
        })->latest()->paginate(4);

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

            'password' => 'required|confirmed',
            'permissions' => 'required|min:1',

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

         Doctor::create($request_data);

        //add doctor to user table
         $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',

            'password' => 'required|confirmed',
            'permissions' => 'required|min:1',

        ]);
        $request_data = $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);

        $user = User::create($request_data);
        $user->attachRole('user');
        $user->syncPermissions($request->permissions);

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
    public function update(Request $request, Doctor $doctor)
    {
        $request->validate([
            'name' => 'required',
            'email' => ['required', Rule::unique('doctors')->ignore($doctor->id)],
            'permissions' => 'required|min:1',
            'phone' => 'required|array|min:1',
            'phone.0' => 'required',
            'address' => 'required',
        ]);

        $request_data = $request->except(['permissions']);
        $request_data['phone'] = array_filter($request->phone);

        $doctor->update($request_data);

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
        $doctor->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.doctors.index');
    }
}
