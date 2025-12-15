<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Category;
use App\Models\Manufacturer;
use App\Models\Product;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\View\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;

class HomeController extends Controller
{

    // Chuyển tới màn hình Đăng nhập bằng Google
    public function getGoogleLogin()
    {
        return Socialite::driver('google')->redirect();
    }
    public function getGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')
                ->setHttpClient(new \GuzzleHttp\Client(['verify' => false]))
                ->stateless()
                ->user();
        } catch (Exception $e) {
            return redirect()->route('user.dangnhap')->with('warning', 'Lỗi xác thực. Xin vui lòng thử lại!');
        }
        $existingUser = User::where('email', $user->email)->first();
        if ($existingUser) {
            // Nếu người dùng đã tồn tại thì đăng nhập
            Auth::login($existingUser, true);
            return redirect()->route('user.home');
        } else {
            // Nếu chưa tồn tại người dùng thì thêm mới
            $newUser = User::create([
                'name' => $user->name,
                'email' => $user->email,
                'username' => Str::before($user->email, '@'),
                'password' => Hash::make('greentech@2025'), // Gán mật khẩu tự do
            ]);
            // Sau đó đăng nhập
            Auth::login($newUser, true);
            return redirect()->route('user.home');
        }
    }
    // HomeController.php

    public function getHome()
    {
        $manufactures = Manufacturer::orderBy('name')->get();

        // Eager Load Category Products (giữ nguyên)
        $categories = Category::with([
            'products' => function ($query) {
                $query->latest()
                    ->with('avatar')
                    ->take(8);
            }
        ])->get();

        $featuredProducts = Product::with(['images', 'category'])
            ->inRandomOrder() // Hoặc dùng latest() / where('is_featured', true)
            ->limit(4)
            ->get();

        // Chuyển đối tượng ProductImages thành mảng chỉ chứa các URL ảnh
        $sliderImages = [];
        foreach ($featuredProducts as $product) {
            // Lấy tất cả ảnh, bao gồm cả avatar
            $allImages = $product->images->pluck('url')->all();
            $sliderImages[$product->slug] = [
                'name' => $product->name,
                'slug' => $product->slug,
                'category_slug' => $product->category->slug,
                'price' => $product->price,
                'images' => array_slice($allImages, 0, 4) // Lấy tối đa 4 ảnh
            ];
        }


        return view('frontend.home', compact('manufactures', 'categories', 'featuredProducts', 'sliderImages'));
    }

    /*public function getHome()
    {
        $manufactures = Manufacturer::orderBy('name')->get();

        $categories = Category::with([
            'products' => function ($query) {
                $query->latest()
                    ->with('avatar')
                    ->take(8);
            }
        ])->get();
        return view('frontend.home', compact('manufactures', 'categories'));
    }*/

    public function getProducts($categoryname_slug = '')
    {
        $query = Product::with(['category', 'manufacturer', 'avatar']);
        $category = null;
        if ($categoryname_slug) {
            $category = Category::where('slug', $categoryname_slug)->first();

            if ($category) {
                $query->where('category_id', $category->id);
                $title = $category->name . ' Products';
            } else {
                $title = 'Products Not Found';
            }
        } else {
            $title = 'All Products';
        }

        $products = $query->orderBy('name', 'asc')->get();

        $categories = Category::all();

        return view('frontend.products', compact('products', 'category', 'categories', 'title'));
    }

    public function getProduct_Details($categoryname_slug = '', $productname_slug = '')
    {
        // Tìm sản phẩm dựa trên slug và eager load tất cả các mối quan hệ cần thiết
        $product = Product::where('slug', $productname_slug)
            ->with(['category', 'manufacturer', 'details', 'images'])
            ->firstOrFail(); // Sử dụng firstOrFail để trả về 404 nếu không tìm thấy

        // Lấy danh mục để sử dụng trong breadcrumb
        $category = $product->category;

        // Đảm bảo có avatar
        $avatar = $product->images->where('is_avatar', true)->first();

        // Lấy 4 sản phẩm liên quan (cùng danh mục, loại trừ sản phẩm hiện tại)
        $relatedProducts = Product::where('category_id', $product->category_id)
            ->where('id', '!=', $product->id)
            ->with('avatar')
            ->inRandomOrder()
            ->take(4)
            ->get();

        $title = $product->name;

        return view('frontend.product_details', compact('product', 'category', 'avatar', 'relatedProducts', 'title'));
    }
    public function getArticles($topicname_slug = '')
    {
        // Bổ sung code tại đây
        return view('frontend.articles');
    }

    public function getArticle_Details($topicname_slug = '', $title_slug = '')
    {
        // Bổ sung code tại đây
        return view('frontend.article_details');
    }

    public function getShoppingCard()
    {
        if (Cart::count() > 0)
            return view('frontend.shoppingcard');
        else
            return view('frontend.shoppingcard');
    }

    public function getCard_Add($productname_slug = '')
    {
        $product = Product::where('slug', $productname_slug)
            ->with(['details', 'avatar'])
            ->first();

        if (!$product) {
            return redirect()->route('frontend.home')->with('error', 'The product does not exist..');
        }
        $details = $product->details;
        $image_url = optional($product->avatar)->url ?? 'product/default.png';

        Cart::add([
            'id' => $product->id,
            'name' => $product->name,
            'price' => $product->price,
            'qty' => 1,
            'weight' => 0,
            'options' => [
                'memory' => optional($details)->memory,
                'cpu' => optional($details)->cpu,
                'graphic' => optional($details)->graphic,
                'power' => optional($details)->power_specs,
                'image' => $image_url,
            ]
        ]);

        return redirect()->route('frontend.home')->with('success', $product->name . ' đã được thêm vào giỏ hàng!');
    }

    public function getCard_Delete($row_id)
    {
        Cart::remove($row_id);
        return redirect()->route('frontend.shoppingcard');
    }

    public function getCard_Decrease($row_id)
    {
        $row = Cart::get($row_id);
        // Nếu số lượng là 1 thì không giảm được nữa
        if ($row->qty > 1) {
            Cart::update($row_id, $row->qty - 1);
        }
        return redirect()->route('frontend.shoppingcard');
    }

    public function getCard_Increase($row_id)
    {
        $row = Cart::get($row_id);
        // Không được tăng vượt quá 10 sản phẩm
        if ($row->qty < 10) {
            Cart::update($row_id, $row->qty + 1);
        }
        return redirect()->route('frontend.shoppingcard');
    }

    public function getRecruitment()
    {
        return view('frontend.recruitment');
    }

    public function getContact()
    {
        return view('frontend.contact');
    }

    public function getRegister()
    {
        return view('user.register');
    }

    public function getLogin()
    {
        return view('user.login');
    }
}
