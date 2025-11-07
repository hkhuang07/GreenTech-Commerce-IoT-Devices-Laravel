<?php

namespace App\Http\Controllers;

use App\Models\IoTDevice;
use App\Models\Product; 
use Illuminate\Http\Request;

class IoTDeviceController extends Controller
{
    public function getList()
    {
        $devices = IoTDevice::with('product')->get();
        return view('iot_devices.list', compact('devices'));
    }
    
    public function getAdd()
    {
        $products = Product::all();
        return view('iot_devices.add', compact('products'));
    }
    
    public function postAdd(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'device_id' => 'required|unique:iot_devices,device_id',
            'location' => 'required|max:100',
        ]);
        
        IoTDevice::create([
            'product_id' => $request->product_id,
            'device_id' => $request->device_id, 
            'location' => $request->location,
            'is_active' => $request->boolean('is_active', true),
        ]);
        
        return redirect()->route('iot_devices.list')->with('success', 'Added IoT device successfully.');
    }
    
    public function getUpdate($id)
    {
        $device = IoTDevice::findOrFail($id);
        $products = Product::all();
        return view('iot_devices.edit', compact('device', 'products'));
    }
    
    public function postUpdate(Request $request, $id)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'device_id' => 'required|unique:iot_devices,device_id,'.$id, 
            'location' => 'required|max:100',
            'is_active' => 'required|boolean',
        ]);
        
        $device = IoTDevice::findOrFail($id);
        $device->update([
            'product_id' => $request->product_id,
            'device_id' => $request->device_id,
            'location' => $request->location,
            'is_active' => $request->boolean('is_active'),
        ]);
        
        return redirect()->route('iot_devices.list')->with('success', 'Updated IoT device successfully.');
    }
    
    public function getDelete($id)
    {
        IoTDevice::findOrFail($id)->delete();
        return redirect()->route('iot_devices.list')->with('success', 'Deleted IoT device successfully.');
    }
}