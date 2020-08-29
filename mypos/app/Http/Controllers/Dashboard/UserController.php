<?php

namespace App\Http\Controllers\Dashboard;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    public function __construct(){
        $this->middleware(['permission:read_users'])->only('index');
        $this->middleware(['permission:create_users'])->only('create');
        $this->middleware(['permission:update_users'])->only('edit');
        $this->middleware(['permission:delete_users'])->only('destroy');

    }

    public function index(Request $request)
    {
        /* the lower case of search
            if($request->search){
            $users = User::where('first_name', 'like', '%' .$request->search . '%' )
            ->orWhere('last_name', 'like', '%' .$request->search . '%')
            ->get();
        } else {
            $users = User::whereRoleIS('admin')->get();
        } */

        $users = User::whereRoleIS('admin')
                ->when($request->search, function($query) use ($request){
                    return $query->where('first_name', 'like', '%' . $request->search . '%' )
                    ->orWhere('last_name', 'like', '%' . $request->search . '%');
                })->get();

        return view('dashboard.users.index', compact('users'));

    }//end of index


    public function create()
    {
        return view('dashboard.users.create');
    }


    public function store(Request $request)
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required',
            'password' => 'required|confirmed',
        ]);

        $request_data= $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);

        $user = User::create($request_data);
        $user->attachRole('admin');
        $user->syncPermissions($request->permissions);

        session()->flash('success', __('site.added_successfully'));

        return redirect()->route('dashboard.users.index');

    }/* end of store */


    public function edit(User $user)
    {
        return view('dashboard.users.edit', compact('user'));
    }


    public function update(Request $request, User $user)
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required',
        ]);

        $request_data= $request->except(['permissions']);
        $user->update($request_data);

        $user->syncPermissions($request->permissions);

        session()->flash('success', __('site.updated_successfully'));

        return redirect()->route('dashboard.users.index');
    }


    public function destroy(User $user)
    {
        //
    }
}
