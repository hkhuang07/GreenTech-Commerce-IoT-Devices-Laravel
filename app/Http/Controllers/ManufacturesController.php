<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use App\Models\Manufacturer;
use Illuminate\Http\Request;

class ManufacturerController extends Controller
{
    public function getList()
    {
        $manufacturers = Manufacturer::withCount('products')->get();
        return view('manufacturers.list', compact('manufacturers'));
    }
    
    public function getAdd()
    {
        return view('manufacturers.add');
    }
    
    public function postAdd(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:manufacturers,name',
            'contact_email' => 'nullable|email',
        ]);
        
        Manufacturer::create([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'address' => $request->address,
            'contact_phone' => $request->contact_phone,
            'contact_email' => $request->contact_email,
        ]);
        
        return redirect()->route('manufacturers.list')->with('success', 'Added manufacturer successfully.');
    }
    
    public function getUpdate($id)
    {
        $manufacturer = Manufacturer::findOrFail($id);
        return view('manufacturers.edit', compact('manufacturer'));
    }
    
    public function postUpdate(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:manufacturers,name,'.$id,
            'contact_email' => 'nullable|email',
        ]);
        
        $manufacturer = Manufacturer::findOrFail($id);
        $manufacturer->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'address' => $request->address,
            'contact_phone' => $request->contact_phone,
            'contact_email' => $request->contact_email,
        ]);
        
        return redirect()->route('manufacturers.list')->with('success', 'Updated manufacturer successfully.');
    }
    
    public function getDelete($id)
    {
        Manufacturer::findOrFail($id)->delete();
        return redirect()->route('manufacturers.list')->with('success', 'Deleted manufacturer successfully.');
    }
}