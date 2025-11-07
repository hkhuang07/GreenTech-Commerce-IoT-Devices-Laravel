<?php

namespace App\Http\Controllers;

use App\Models\OrderStatus;
use Illuminate\Http\Request;

class OrderStatusController extends Controller
{
    public function getList()
    {
        $statuses = OrderStatus::all();
        return view('order_statuses.list', compact('statuses'));
    }
    
    public function getAdd()
    {
        return view('order_statuses.add');
    }
    
    public function postAdd(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:order_statuses,name|max:50',
        ]);
        
        OrderStatus::create(['name' => $request->name]);
        
        return redirect()->route('order_statuses.list')->with('success', 'Added order status successfully.');
    }
    
    public function getUpdate($id)
    {
        $status = OrderStatus::findOrFail($id);
        return view('order_statuses.edit', compact('status'));
    }
    
    public function postUpdate(Request $request, $id)
    {
        $status = OrderStatus::findOrFail($id);
        
        $request->validate([
            'name' => 'required|unique:order_statuses,name,'.$id.'|max:50',
        ]);
        
        $status->update(['name' => $request->name]);
        
        return redirect()->route('order_statuses.list')->with('success', 'Updated order status successfully.');
    }
    
    // Xử lý Xóa (D - Delete)
    public function getDelete($id)
    {
        $status = OrderStatus::findOrFail($id);
        
        if ($status->orders()->count() > 0) {
            return redirect()->route('order_statuses.list')->with('error', 'Cannot delete: There are still orders using this status.');
        }
        
        $status->delete();

        return redirect()->route('order_statuses.list')->with('success', 'Deleted order status successfully.');
    }
}