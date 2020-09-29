<?php

namespace App\Http\Controllers\Dashboard;

use App\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\StudentSubject;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;


class AdminController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_admins'])->only('index');
        $this->middleware(['permission:create_admins'])->only('create');
        $this->middleware(['permission:update_admins'])->only('edit');
        $this->middleware(['permission:delete_admins'])->only('destroy');

    }

    public function index(Request $request)
    {


        $admins = Admin::whereRoleIs('admin')->where(function($q) use ($request){

            return $q->when($request->search, function($query) use ($request){

                return $query->where('name', 'like', '%'. $request->search .'%')
                    ->orWhere('last_name', 'like', '%'. $request->search .'%');

            });
        })->latest()->paginate(6);

        return view('dashboard.admins.index', compact('admins'));

    }//end of index


    public function create()
    {
        return view('dashboard.admins.create');
    }


    public function store(Request $request, Admin $admin)
    {
        $request->validate([
            'name' => 'required',
            //'last_name' => 'required',
            'email' => ['required', Rule::unique('admins')->ignore($admin->id)],
            'password' => 'required|confirmed',
            //'permissions' => 'required|min:1',

        ]);

        $request_data= $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);

        $admin = Admin::create($request_data);
        $admin->attachRole('admin');
        //$admin->syncPermissions($request->permissions);

        //add doctor to user table
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'type'  =>  'admin',
            'password' => 'required|confirmed',
            //'permissions' => 'required|min:1',

        ]);
        $request_data = $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);
        $request_data['type'] = 'admin';
        $request_data['fid']  = $admin->id;


        $user = User::create($request_data);
        $user->attachRole('admin');
        //$user->syncPermissions($request->permissions);

        session()->flash('success', __('site.added_successfully'));

        return redirect()->route('dashboard.admins.index');

    }/* end of store */


    public function edit(Admin $admin)
    {
        return view('dashboard.admins.edit', compact('admin'));
    }


    public function update(Request $request, Admin $admin, User $user)
    {
        $request->validate([
            'name' => 'required',
            //'last_name' => 'required',
            'email' => 'required',
        ]);

        $request_data= $request->except(['permissions']);
        $admin->update($request_data);
        //update the admin in user table
        $uid = DB::select("SELECT id FROM users  WHERE email = ?", [$admin->email]);

        $request->validate([
            'name' => 'required',
            //'last_name' => 'required',
            'email' => 'required',
        ]);

        //dd($uid);
        //$user->id = $uid;
        $users = User::all();

        foreach ($users as $myuser) {
            if($myuser->id == $uid){
                $request_data= $request->except(['permissions']);
                $user->update($request_data);
            }
        }


        session()->flash('success', __('site.updated_successfully'));

        return redirect()->route('dashboard.admins.index');
    }


    public function destroy(Admin $admin)
    {
        $admin->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.admins.index');
    }
}
