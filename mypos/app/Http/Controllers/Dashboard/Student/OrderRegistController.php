<?php

namespace App\Http\Controllers\Dashboard\student;

use App\Doctor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\OrderRegist;
use App\Student;
use App\Subject;

class OrderRegistController extends Controller
{
    public function index(){

    }//end of index

    public function create(Student $student){
        $doctors = Doctor::all();
        $ordersRegist = $student->ordersRegits()->with('subjects')->paginate(5);
        return view('dashboard.students.ordersRegist.create', compact('doctors','student', 'ordersRegist'));
    }//end of create

    public function store(Request $request, Student $student){

        $request->validate([
            'subjects' => 'required|array',
            //'quantities' => 'required|array'
        ]);

        //$this->attach_order($request, $student);
        $order = $student->ordersRegits()->create([]);
        foreach($request->subjects as $index=>$subject){
            $order->subjects()->attach($subject,['quantity' => $request->quantity[$index]]);
        }
        session()->flash('success', __('site.added_successfully'));
        return redirect()->route('dashboard.ordersRegist.index');

    }//end of store

    public function edit(Student $student, OrderRegist $order){
        $doctors = Doctor::with('subjects')->get();
        $orders = $student->ordersRegits()->with('subjects')->paginate(5);
        return view('dashboard.students.ordersRegist.edit', compact('student', 'order', 'doctors', 'orders'));
    }//end of edit

    public function update(Request $request, Student $student, OrderRegist $order){
        $request->validate([
            'subjects' => 'required|array',
            //'quantities' => 'required|array'
        ]);

        $this->detach_order($order);

        $this->attach_order($request, $student);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->route('dashboard.ordersRegist.index');
    }//end of update


    private function attach_order($request, $student){
        $order = $student->ordersRegits()->create([]);

        $order->subjects()->attach($request->subjects);

        foreach ($request->subjects as $id=>$quantity) {

            $subject = Subject::FindOrFail($id);
            $subject->update([
                'sbj_num' => $subject->sbj_num - $quantity['quantity']
            ]);
        }//end of foreach


    }//end of attach_order

    private function detach_order($order){
        foreach($order->subjects as $subject){
            $subject->update([
                'sbj_num' => $subject->sbj_num + $subject->pivot->quantity
            ]);
        }//end of foreach

        $order->delete();
    }//end of detach_order
}
