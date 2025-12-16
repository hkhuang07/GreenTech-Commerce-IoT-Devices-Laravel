<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-bs-theme="light" data-pwa="true">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>Login | {{ config('app.name', 'GreenTech') }}</title>

    <link rel="stylesheet" href="{{ asset('public/assets/vendor/font-awesome/css/all.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('public/assets/icons/cartzilla-icons.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('public/assets/css/theme.min.css') }}" id="theme-styles" />

    <link rel="stylesheet" href="{{ asset('public/css/form.css') }}" />
    <link rel="stylesheet" href="{{ asset('public/css/layout.css') }}" />
</head>

<body>
    <main class="content-wrapper w-100 auth-container-greentech">
        <div class="d-lg-flex">

            <div class="d-flex flex-column min-vh-100 w-100 py-4 px-3 px-lg-0 auth-form-section">

                <header class="navbar px-0 pb-4 mt-n2 mt-sm-0 mb-2 mb-md-3 mb-lg-4">
                    <a href="{{ route('frontend.home') }}" class="navbar-brand pt-0 d-flex align-items-center">
                        <span class="d-flex flex-shrink-0 text-primary me-2 auth-logo-greentech">
                            <img src="{{ asset('public/images/greentech-logo.jpg') }}" alt="{{ config('app.name', 'GreenTech') }} Logo" />
                        </span>
                        <span class="fw-bold fs-5">{{ config('app.name', 'GreenTech') }}</span>
                    </a>
                </header>

                <h1 class="h2 mt-auto">Sign In to GreenTech</h1>

                <div class="nav fs-sm mb-4">
                    Don't have an account yet?
                    <a class="nav-link text-decoration-underline p-0 ms-2" href="{{ route('user.register') }}">Create an account</a>
                </div>

                @if(session('warning'))
                <div class="alert d-flex alert-danger" role="alert">
                    <i class="ci-banned fs-lg pe-1 mt-1 me-2"></i>
                    <div>{{ session('warning') }}</div>
                </div>
                @endif
                @if (session('status'))
                <div class="alert d-flex alert-success" role="alert">
                    <i class="ci-check-circle fs-lg pe-1 mt-1 me-2"></i>
                    <div>{{ session('status') }}</div>
                </div>
                @endif
                @if (session('success'))
                <div class="alert d-flex alert-success" role="alert">
                    <i class="ci-check-circle fs-lg pe-1 mt-1 me-2"></i>
                    <div>{{ session('success') }}</div>
                </div>
                @endif

                <form method="post" action="{{ route('user.login.post') }}" class="needs-validation" novalidate id="loginForm">
                    @csrf

                    <div class="position-relative mb-4">
                        <input type="text"
                            class="form-control form-control-lg auth-input {{ ($errors->has('email') || $errors->has('username') || $errors->has('login')) ? 'is-invalid' : '' }}"
                            id="email"
                            name="email"
                            value="{{ old('email') }}"
                            placeholder="Email, Username, or Phone Number"
                            required />
                        @error('email')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                        @error('username')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                        @error('login')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>

                    <div class="mb-4">
                        <div class="password-toggle">
                            <input type="password"
                                class="form-control form-control-lg auth-input {{ $errors->has('password') ? 'is-invalid' : '' }}"
                                id="password"
                                name="password"
                                placeholder="Password"
                                required />
                            @error('password')
                            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                            @enderror
                            <label class="password-toggle-button fs-lg">
                                <input type="checkbox" class="btn-check" />
                            </label>
                        </div>
                    </div>

                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="form-check me-2">
                            <input class="form-check-input" type="checkbox" id="remember" name="remember" {{ old('remember') ? 'checked' : '' }} />
                            <label for="remember" class="form-check-label">Remember me</label>
                        </div>
                        @if (Route::has('password.request'))
                        <div class="nav">
                            <a class="nav-link animate-underline p-0" href="{{ route('password.request') }}">
                                <span class="animate-target">Forgot your password?</span>
                            </a>
                        </div>
                        @endif
                    </div>

                    <button type="submit" class="auth-btn-login btn btn-lg btn-primary w-100" id="loginButton">
                        <span class="btn-text">Log In</span>
                        <span class="btn-loading" style="display: none;">
                            <i class="fas fa-spinner fa-spin"></i>
                        </span>
                    </button>
                </form>

                <div class="d-flex align-items-center my-4">
                    <hr class="w-100 m-0">
                    <span class="text-body-emphasis fw-medium text-nowrap mx-4">or sign in with</span>
                    <hr class="w-100 m-0">
                </div>

                <div class="d-flex flex-column flex-sm-row gap-3 pb-4 mb-3 mb-lg-4">
                    <a href="{{ route('google.login') }}" class="btn btn-lg btn-outline-secondary w-100 px-2">
                        <i class="ci-google ms-1 me-1"></i> Google
                    </a>
                    <a href="#" class="btn btn-lg btn-outline-secondary w-100 px-2">
                        <i class="ci-facebook ms-1 me-1"></i> Facebook
                    </a>
                    <a href="#" class="btn btn-lg btn-outline-secondary w-100 px-2">
                        <i class="ci-apple ms-1 me-1"></i> Apple
                    </a>
                </div>

                <!--footer class="mt-auto">
                   
                </footer-->
                <p class="fs-xs mb-0">
                    Copyright &copy; by <span class="animate-underline"><a class="animate-target text-dark-emphasis text-decoration-none" href="#" target="_blank">{{ config('app.name', 'GreenTech') }}</a></span>.
                </p>
            </div>

            <div class="d-none d-lg-block w-100 py-4 ms-auto auth-cover-greentech" style="max-width:1034px">
                <div class="d-flex flex-column justify-content-center h-100 rounded-5 overflow-hidden">
                    <div class="text-center p-5 auth-welcome-content">
                        <h1 class="display-3 fw-bold mb-3">GreenTech IoT</h1>
                        <p class="lead fw-medium">Smart Agriculture, Fueling Markets.</p>

                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');
            const button = document.getElementById('loginButton');
            const loginInput = form.querySelector('input[name="email"]'); // Dùng 'email' vì bạn dùng chung cho username/email
            const passwordInput = form.querySelector('input[name="password"]');

            // 1. Kích hoạt/Vô hiệu hóa nút
            function checkFormValidity() {
                const isValid = loginInput.value.trim() !== '' && passwordInput.value.trim() !== '';
                button.disabled = !isValid;
            }

            loginInput.addEventListener('input', checkFormValidity);
            passwordInput.addEventListener('input', checkFormValidity);
            checkFormValidity();

            // 2. Form submission handling (Hiển thị Spinner)
            form.addEventListener('submit', function(e) {
                if (!button.disabled) {
                    // Chỉ kích hoạt loading nếu form hợp lệ
                    button.disabled = true;
                    button.querySelector('.btn-text').style.display = 'none';
                    button.querySelector('.btn-loading').style.display = 'inline-block';
                }
            });
        });
    </script>
    <script src="{{ asset('public/assets/js/theme.min.js') }}"></script>
</body>

</html>