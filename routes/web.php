<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\ManufacturesController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\OrderStatusController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\IoTDeviceController;
use App\Http\Controllers\DeviceMetricController;
use App\Http\Controllers\AlertThresholdsController;
use App\Http\Controllers\ProductDetailsController;
use App\Models\Categories;
use App\Models\Order;
use App\Models\ProductDetails;
use App\Models\IoTDevice;
use App\Models\DeviceMetric;
use App\Models\AlertThreshold;

Auth::routes();

// Trang chủ
Route::get('/', [HomeController::class, 'getHome'])->name('frontend');
Route::get('/home', [HomeController::class, 'getHome'])->name('frontend');

// Quản lý Loại sản phẩm
Route::get('/categories', [CategoriesController::class, 'getList'])->name('categories');
Route::get('/categories/add', [CategoriesController::class, 'getAdd'])->name('categories.add');
Route::post('/categories/add', [CategoriesController::class, 'postAdd'])->name('categories.add');
Route::get('/categories/update/{id}', [CategoriesController::class, 'getUpdate'])->name('categories.update');
Route::post('/categories/update/{id}', [CategoriesController::class, 'postUpdate'])->name('categories.update');
Route::get('/categories/delete/{id}', [CategoriesController::class, 'getDelete'])->name('categories.delete');

// Quản lý Hãng sản xuất
Route::get('/manufactures', [ManufacturesController::class, 'getList'])->name('manufactures');
Route::get('/manufactures/add', [ManufacturesController::class, 'getAdd'])->name('manufactures.add');
Route::post('/manufactures/add', [ManufacturesController::class, 'postAdd'])->name('manufactures.add');
Route::get('/manufactures/update/{id}', [ManufacturesController::class, 'getUpdate'])->name('manufactures.update');
Route::post('/manufactures/update/{id}', [ManufacturesController::class, 'postUpdate'])->name('manufactures.update');
Route::get('/manufactures/delete/{id}', [ManufacturesController::class, 'getDelete'])->name('manufactures.delete');

// Quản lý Sản phẩm
Route::get('/products', [ProductsController::class, 'getList'])->name('products');
Route::get('/products/add', [ProductsController::class, 'getAdd'])->name('products.add');
Route::post('/products/add', [ProductsController::class, 'postAdd'])->name('products.add');
Route::get('/products/update/{id}', [ProductsController::class, 'getUpdate'])->name('products.update');
Route::post('/products/update/{id}', [ProductsController::class, 'postUpdate'])->name('products.update');
Route::get('/products/delete/{id}', [ProductsController::class, 'getDelete'])->name('products.delete');

// Quản lý Tình trạng
Route::get('/order-status', [OrderStatusController::class, 'getList'])->name('order-status');
Route::get('/order-status/add', [OrderStatusController::class, 'getAdd'])->name('order-status.add');
Route::post('/order-status/add', [OrderStatusController::class, 'postAdd'])->name('order-status.add');
Route::get('/order-status/update/{id}', [OrderStatusController::class, 'getUpdate'])->name('order-status.update');
Route::post('/order-status/update/{id}', [OrderStatusController::class, 'postUpdate'])->name('order-status.update');
Route::get('/order-status/delete/{id}', [OrderStatusController::class, 'getDelete'])->name('order-status.delete');

// Quản lý Đơn hàng
Route::get('/orders', [OrderController::class, 'getList'])->name('orders');
Route::get('/orders/add', [OrderController::class, 'getAdd'])->name('orders.add');
Route::post('/orders/add', [OrderController::class, 'postAdd'])->name('orders.add');
Route::get('/orders/update/{id}', [OrderController::class, 'getUpdate'])->name('orders.update');
Route::post('/orders/update/{id}', [OrderController::class, 'postUpdate'])->name('orders.update');
Route::get('/orders/delete/{id}', [OrderController::class, 'getDelete'])->name('orders.delete');

// Quản lý Tài khoản người dùng
Route::get('/users', [UserController::class, 'getList'])->name('users');
Route::get('/users/add', [UserController::class, 'getAdd'])->name('users.add');
Route::post('/users/add', [UserController::class, 'postAdd'])->name('users.add');
Route::get('/users/update/{id}', [UserController::class, 'getUpdate'])->name('users.update');
Route::post('/users/update/{id}', [UserController::class, 'postUpdate'])->name('users.update');
Route::get('/users/delete/{id}', [UserController::class, 'getDelete'])->name('users.delete');

// Quản lý Thiết bị IoT
Route::get('/iot-devices', [IoTDeviceController::class, 'getList'])->name('iot-devices');
Route::get('/iot-devices/add', [IoTDeviceController::class, 'getAdd'])->name('iot-devices.add');
Route::post('/iot-devices/add', [IoTDeviceController::class, 'postAdd'])->name('iot-devices.add');
Route::get('/iot-devices/update/{id}', [IoTDeviceController::class, 'getUpdate'])->name('iot-devices.update');
Route::post('/iot-devices/update/{id}', [IoTDeviceController::class, 'postUpdate'])->name('iot-devices.update');
Route::get('/iot-devices/delete/{id}', [IoTDeviceController::class, 'getDelete'])->name('iot-devices.delete');

// Quản lý chỉ số thiết bị
Route::get('/device-metrics', [DeviceMetricController::class, 'getList'])->name('device-metrics');
Route::get('/device-metrics/add', [DeviceMetricController::class, 'getAdd'])->name('device-metrics.add');
Route::post('/device-metrics/add', [DeviceMetricController::class, 'postAdd'])->name('device-metrics.add');
Route::get('/device-metrics/update/{id}', [DeviceMetricController::class, 'getUpdate'])->name('device-metrics.update');
Route::post('/device-metrics/update/{id}', [DeviceMetricController::class, 'postUpdate'])->name('device-metrics.update');
Route::get('/device-metrics/delete/{id}', [DeviceMetricController::class, 'getDelete'])->name('device-metrics.delete');

// Quản lý ngưỡng cảnh báo
Route::get('/alert-thresholds', [AlertThresholdsController::class, 'getList'])->name('alert-thresholds');
Route::get('/alert-thresholds/add', [AlertThresholdsController::class, 'getAdd'])->name('alert-thresholds.add');
Route::post('/alert-thresholds/add', [AlertThresholdsController::class, 'postAdd'])->name('alert-thresholds.add');
Route::get('/alert-thresholds/update/{id}', [AlertThresholdsController::class, 'getUpdate'])->name('alert-thresholds.update');
Route::post('/alert-thresholds/update/{id}', [AlertThresholdsController::class, 'postUpdate'])->name('alert-thresholds.update');
Route::get('/alert-thresholds/delete/{id}', [AlertThresholdsController::class, 'getDelete'])->name('alert-thresholds.delete');