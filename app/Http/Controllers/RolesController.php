<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function getList()
    {
        $roles = Role::all();
        return view('roles.list', compact('roles'));
    }
    
    public function getAdd()
    {
        return view('roles.add');
    }
    
    public function postAdd(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:roles,name|max:50',
            'description' => 'nullable|string',
        ]);
        
        Role::create($request->all());
        
        return redirect()->route('roles.list')->with('success', 'Added role successfully.');
    }
    
    public function getUpdate($id)
    {
        $role = Role::findOrFail($id);
        return view('roles.edit', compact('role'));
    }
    
    public function postUpdate(Request $request, $id)
    {
        $role = Role::findOrFail($id);
        
        $request->validate([
            'name' => 'required|unique:roles,name,'.$id.'|max:50',
            'description' => 'nullable|string',
        ]);
        
        $role->update($request->all());
        
        return redirect()->route('roles.list')->with('success', 'Updated role successfully.');
    }
    
    public function getDelete($id)
    {
        $role = Role::findOrFail($id);
        
        if ($role->users()->count() > 0) {
            return redirect()->route('roles.list')->with('error', 'Cannot delete: There are still users assigned to this role.');
        }
        
        $role->delete();
        
        return redirect()->route('roles.list')->with('success', 'Deleted role successfully.');
    }
}