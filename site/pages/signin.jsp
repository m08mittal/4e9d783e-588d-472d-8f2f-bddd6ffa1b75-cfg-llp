<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>Welcome To Cypher Future Group</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="../css/login.css" rel="stylesheet">

  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Cypher Future Group</a>
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form" action="LoginServlet" method="POST">
            <div class="form-group">
              <input type="text" placeholder="UserId" class="form-control" name="userUniqueId">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" name="password">
            </div>
            
            <button type="submit" class="btn btn-primary btn-sm">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </div>

	<!-- Not needed for now -->
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h2>Welcome from our all partners!</h2>
        <p>Welcome to Cypher Future Group. We build together. We make our dreams true. Rock the world.</p>
		<p>Website is under construction. </p>
        <p><a class="btn btn-primary btn-lg" role="button">Sign Up &raquo;</a></p>
		<br/>
		<br/>
		<br/>
		<br/>
      </div>
    </div> 

    <div class="container">
		
      <hr>

      <footer>
        <p>Cypher Future Group &copy; 2014</p>
      </footer>
    </div> <!-- /container -->
     

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
