<?php
session_start();

$message = '';
$messageType = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $username = trim($_POST['username'] ?? '');
  $password = trim($_POST['password'] ?? '');

  if ($username === '' || $password === '') {
    $message = 'Semua field wajib diisi.';
    $messageType = 'error';
  } elseif (isset($_SESSION['users'][$username])) {
    $message = 'Username sudah terdaftar.';
    $messageType = 'error';
  } else {
    if (!isset($_SESSION['users'])) {
      $_SESSION['users'] = [];
    }
    $_SESSION['users'][$username] = password_hash($password, PASSWORD_DEFAULT);
    $message = 'User is added';
    $messageType = 'success';
  }
}

?>

<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - M Aulia Muzzaki N - 2311102051</title>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      body {
        font-family: 'Segoe UI', sans-serif;
        background: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }

      .card {
        background: #fff;
        padding: 2rem 2.5rem;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, .1);
        width: 100%;
        max-width: 400px;
      }

      h1 {
        text-align: center;
        margin-bottom: 1.5rem;
        color: #333;
        font-size: 1.6rem;
      }

      label {
        display: block;
        margin-bottom: .3rem;
        font-size: .9rem;
        color: #555;
      }

      input[type=text],
      input[type=password] {
        width: 100%;
        padding: .65rem .85rem;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 1rem;
        margin-bottom: 1rem;
        transition: border-color .2s;
      }

      input[type=text]:focus,
      input[type=password]:focus {
        outline: none;
        border-color: #4f8ef7;
      }

      .btn {
        display: block;
        width: 100%;
        padding: .75rem;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
        transition: background .2s;
      }

      .btn-primary {
        background: #4f8ef7;
        color: #fff;
        margin-bottom: .75rem;
      }

      .btn-primary:hover {
        background: #3a7ae4;
      }

      .btn-secondary {
        background: #e9ecef;
        color: #333;
      }

      .btn-secondary:hover {
        background: #dee2e6;
      }

      .alert {
        padding: .75rem 1rem;
        border-radius: 8px;
        margin-bottom: 1rem;
        font-size: .9rem;
        text-align: center;
      }

      .alert.success {
        background: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
      }

      .alert.error {
        background: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
      }

      .divider {
        text-align: center;
        color: #aaa;
        margin: .5rem 0;
        font-size: .85rem;
      }
    </style>
  </head>
  <body>
    <div class="card">
      <h1>Register</h1>

      <?php if ($message !== ''): ?>
      <div class="alert <?= htmlspecialchars($messageType) ?>">
        <?= htmlspecialchars($message) ?>
      </div>
      <?php endif; ?>

      <form method="POST" action="register.php">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" value="<?= htmlspecialchars($_POST['username'] ?? '') ?>"
          required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" class="btn btn-primary">Daftar</button>
      </form>

      <div class="divider">atau</div>

      <a href="login.php">
        <button type="button" class="btn btn-secondary">Sudah punya akun? Login</button>
      </a>
    </div>
  </body>
</html>