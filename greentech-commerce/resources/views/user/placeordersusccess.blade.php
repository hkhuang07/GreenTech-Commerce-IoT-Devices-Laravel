@extends('layouts.frontend')
@section('title', 'Placed Order Successfully')
@section('content')
<!-- Page content -->
<main class="content-wrapper">
    <section class="container mt-4 mb-4">
        <div class="position-relative overflow-hidden rounded-5 p-4 p-sm-5" style="background-color:var(--cz-success-border-subtle)">
            <div class="position-relative z-2 text-center py-4 py-md-5 my-md-2 my-lg-5 mx-auto" style="max-width:536px">
                <h1 class="pt-xl-4 mb-4">Cảm ơn bạn đã đặt hàng!</h1>
                <p class="text-dark-emphasis pb-3 pb-sm-4">Đơn hàng đã được chấp nhận và sẽ được xử lý sớm nhất có thể.</p>
                <a class="btn btn-lg btn-dark rounded-pill mb-xl-4" href="{{ route('frontend.home') }}">Tiếp tục mua sắm</a>
            </div>
            <img src="{{ asset('public/assets/img/checkout/thankyou-bg-1.png') }}" class="animate-up-down position-absolute top-0 start-0 w-100 h-100 object-fit-cover" alt="Background image" />
            <img src="{{ asset('public/assets/img/checkout/thankyou-bg-2.png') }}" class="animate-down-up position-absolute top-0 start-0 w-100 h-100 object-fit-cover" alt="Background image" />
        </div>
    </section>
</main>
@endsection