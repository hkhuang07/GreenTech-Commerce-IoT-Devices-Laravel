<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category; // Cần để lấy danh mục
use App\Models\Manufacturer; // Cần để lấy nhà sản xuất
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function getList()
    {
        $products = Product::with(['category', 'manufacturer', 'details'])->latest()->get();
        return view('products.list', compact('products'));
    }
    
    public function getAdd()
    {
        $categories = Category::all();
        $manufacturers = Manufacturer::all();
        return view('products.add', compact('categories', 'manufacturers'));
    }
    
    public function postAdd(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:products,name',
            'category_id' => 'required|exists:categories,id',
            'manufacturer_id' => 'required|exists:manufacturers,id',
            'price' => 'required|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
        ]);
        
        $product = Product::create([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'category_id' => $request->category_id,
            'manufacturer_id' => $request->manufacturer_id,
            'price' => $request->price,
            'stock_quantity' => $request->stock_quantity,
            'description' => $request->description,
        ]);
        
        return redirect()->route('products.getUpdate', $product->id)->with('success', 'Added product successfully. Let update product images and details now.');

    }
    
    // Hiển thị form Cập nhật (U - Update)
    public function getUpdate($id)
    {
        // Tải tất cả các quan hệ: details, images, category, manufacturer
        $product = Product::with(['details', 'images', 'category', 'manufacturer'])->findOrFail($id);
        $categories = Category::all();
        $manufacturers = Manufacturer::all();
        
        return view('products.edit', compact('product', 'categories', 'manufacturers'));
    }
    
    public function postUpdate(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:products,name,'.$id,
            'category_id' => 'required|exists:categories,id',
            'price' => 'required|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
        ]);
        
        $product = Product::findOrFail($id);
        $product->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'category_id' => $request->category_id,
            'manufacturer_id' => $request->manufacturer_id,
            'price' => $request->price,
            'stock_quantity' => $request->stock_quantity,
            'description' => $request->description,
        ]);
        
        return redirect()->route('products.getUpdate', $product->id)->with('success', 'Updated product successfully.');
    }
    
    public function getDelete($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        
        return redirect()->route('products.list')->with('success', 'Deleted product successfully.');
    }
}