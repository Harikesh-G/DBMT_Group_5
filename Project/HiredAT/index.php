<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
     <form action="login.php" method="post">
     	<h2>LOGIN</h2>
     	<?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>
     	<label>User ID</label>
     	<input type="text" name="uname" placeholder="User ID"><br>

     	<label>Password</label>
     	<input type="password" name="password" placeholder="Password"><br>

		<button type="submit">Login</button>
     </form>
	 <form action="register.php" class="inline">
     	<button class="float-left submit-button" >Register new account</button>
	 </form>
</body>
</html>