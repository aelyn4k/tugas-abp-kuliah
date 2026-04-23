<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="{{ route('register') }}" method="POST">
                        @csrf
                        <div class="mb-4 row">
                            <div class="offset-sm-3 col-sm-9">
                                <h2 class="mb-0">Registration</h2>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="name" class="col-sm-3 col-form-label">Nama</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="email" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="password" class="col-sm-3 col-form-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                        <div class="mt-3 row">
                            <div class="offset-sm-3 col-sm-9 d-flex align-items-center justify-content-between gap-2">
                                <button type="submit" class="btn btn-success col-3">Register</button>
                                <a href="{{ route('login') }}">Sudah punya akun? Login</a>
                            </div>
                        </div>
                        @if ($errors->any())
                            <div class="mt-3 row">
                                <div class="offset-sm-3 col-sm-9 text-danger">
                                    {{ $errors->first() }}
                                </div>
                            </div>
                        @endif
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
