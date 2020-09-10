<?php

namespace App\Http\Controllers\Dashboard;

use App\Doctor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class DoctorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $doctors = Doctor::when($request->search, function ($q) use ($request){
            return $q->where('four_name', 'like', '%'. $request->search . '%');
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
            'four_name' => 'required',
            'email' => 'required|unique:users',

            'password' => 'required|confirmed',
            'permissions' => 'required|min:1',

            'phone' => 'required|array|min:1',
            'phone.0' => 'required',

            'address' => 'required',
            'image' => 'image',
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

         Doctor::create($request_data);


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
            'four_name' => 'required',
            'email' => 'required|unique:students',
            'image' => 'image',
            'permissions' => 'required|min:1',
            'phone' => 'required|array|min:1',
            'phone.0' => 'required',
            'address' => 'required',
        ]);

        $request_data = $request->except(['permissions', 'image']);
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
