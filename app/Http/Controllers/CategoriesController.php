<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function getList()
    {
        $categories = Category::all();
        return view('categories.list', compact('categories'));
    }
    
    public function getAdd()
    {
        $parentCategories = Category::whereNull('parent_id')->get();
        return view('categories.add', compact('parentCategories'));
    }
    
    public function postAdd(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories,name',
        ]);
        
        $orm = new Category();
        $orm->name = $request->name;
        $orm->slug = Str::slug($request->name, '-');
        $orm->description = $request->description;
        $orm->parent_id = $request->parent_id; 
        $orm->save();
        
        return redirect()->route('categories.list')->with('success', 'Added category successfully.');
    }
    
    public function getUpdate($id)
    {
        $category = Category::findOrFail($id);
        $parentCategories = Category::whereNull('parent_id')->get();
        return view('categories.edit', compact('category', 'parentCategories'));
    }
    
    // Xử lý Cập nhật (U - Update)
    public function postUpdate(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:categories,name,'.$id,
        ]);
        
        $orm = Category::findOrFail($id);
        $orm->name = $request->name;
        $orm->slug = Str::slug($request->name, '-');
        $orm->description = $request->description;
        $orm->parent_id = $request->parent_id;
        $orm->save();
        
        return redirect()->route('categories.list')->with('success', 'Updated category successfully.');
    }
    
    public function getDelete($id)
    {
        $orm = Category::findOrFail($id);
        $orm->delete();
        
        return redirect()->route('categories.list')->with('success', 'Deleted category successfully.');
    }
}