<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderStatus;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function getList()
    {
        $orders = Order::with(['user', 'status'])->latest()->get();
        return view('orders.list', compact('orders'));
    }

    public function getAdd()
    {
        /* Notes:
            Các hàm getAdd/postAdd dành cho frontend không được triển khai ở backend controller vì quy trình đặt hàng từ giỏ hàng của khách hàng (Frontend logic).
        */
        /*
            $statuses = OrderStatus::all();
            return view('orders.add', compact('statuses'));
        */
    }

    public function postAdd(Request $request)
    {
       /*
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'order_status_id' => 'required|exists:order_statuses,id',
            'shipping_address' => 'required|string|max:255',
            'contact_phone' => 'required|string|max:20',
            'total_amount' => 'required|numeric|min:0',
            'payment_method' => 'required|string|max:50',
        ]);

        Order::create([
            'user_id' => $request->user_id,
            'order_status_id' => $request->order_status_id,
            'shipping_address' => $request->shipping_address,
            'contact_phone' => $request->contact_phone,
            'total_amount' => $request->total_amount,
            'payment_method' => $request->payment_method,
        ]);

        return redirect()->route('orders.list')->with('success', 'Created order successfully.');
        */
    }


    public function getUpdate($id)
    {
        $order = Order::with(['user', 'status', 'items.product'])->findOrFail($id);
        $statuses = OrderStatus::all();

        return view('orders.edit', compact('order', 'statuses'));
    }

    public function postUpdate(Request $request, $id)
    {
        $order = Order::findOrFail($id);

        $request->validate([
            'order_status_id' => 'required|exists:order_statuses,id',
            'notes' => 'nullable|string',
        ]);

        $order->update([
            'order_status_id' => $request->order_status_id,
            'notes' => $request->notes,
        ]);

        return redirect()->route('orders.list')->with('success', 'Cập nhật trạng thái đơn hàng thành công.');
    }

    public function getDelete($id)
    {
        Order::findOrFail($id)->delete();

        return redirect()->route('orders.list')->with('success', 'Xóa đơn hàng thành công.');
    }
}
