<?php

namespace App\Http\Controllers\Dashboard;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

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

        $users = User::whereRoleIs('admin')->where(function($q) use ($request){

            return $q->when($request->search, function($query) use ($request){

                return $query->where('name', 'like', '%'. $request->search .'%')
                    ->orWhere('last_name', 'like', '%'. $request->search .'%');

            });
        })->latest()->paginate(4);

        return view('dashboard.users.index', compact('users'));

    }//end of index

    //change name function
    public function changeName(Request $request,$id){
        //$user = User::findOrFail($id);
        $user = User::find($id);
        //$user = DB::table('users')->where('name', $request->name)->first();

        $request_data = array(
            'name' => $request->name,
        );

        $user->update(['name' => $request->name]);
        session()->flash('success', __('site.updated_successfully'));
        return redirect()->route('dashboard.index');

    }

    public function create()
    {
        return view('dashboard.users.create');
    }


    public function store(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required',
            //'last_name' => 'required',
            'email' => ['required', Rule::unique('users')->ignore($user->id)],
            'password' => 'required|confirmed',
        ]);

        $request_data= $request->except(['password', 'password_confirmation', 'permissions']);
        $request_data['password'] = bcrypt($request->password);

        $user = User::create($request_data);
        $user->attachRole('user');
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
            'name' => 'required',
            //'last_name' => 'required',
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
        $user->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.users.index');
    }
}
