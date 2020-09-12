<?php

namespace App\Http\Controllers\Dashboard;

use App\OrderRegist;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderRegistController extends Controller
{
    public function index(Request $request){
        $orders = OrderRegist::whereHas('student', function ($q) use ($request){
            return $q->where('name', 'like', '%' .$request->search . '%');
        })->paginate(5);
        return view('dashboard.ordersRegist.index', compact('orders'));
    }//end of index

    public function subjects(OrderRegist $order){
        $subjects = $order->subjects;
        return view('dashboard.ordersRegist._subjects', compact('order','subjects'));
    }

    public function destroy(OrderRegist $order){

        foreach($order->subjects as $subject){
            $subject->update([]);
        }
        $order->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->route('dashboard.ordersRegist.index');
    }
}
