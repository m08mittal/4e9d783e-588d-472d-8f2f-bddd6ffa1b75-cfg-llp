<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.llp.amsws.model.User"
	import="java.util.List" import="com.llp.amsws.model.Transaction"
	import="com.llp.amsws.servlets.ServletConstants"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../assets/ico/favicon.ico">

<title>Your Home Page</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/navbar-static-top.css" rel="stylesheet">

<!--Java Scripts -->
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
  $("#myaccount1").click(function(e){
  e.preventDefault();
    $.ajax({url:"MyAccount.html",success:function(result){
      $(".jumbotron").html(result);
    }});
  });
  var transactions = '';
  $("#viewTransactions").click(function(e){
  e.preventDefault();
    $.ajax({
	dataType : 'json',
	type: "GET",  
    url: "AccountStatementServlet", success:function(data){
    	for(var i = 0, size = data.length; i < size ; i++){
    	    var accountStatement = "<tr><td>" + data[i].transactionDate + "</td><td>" + data[i].amountCredited + "</td><td>" + 
    	    data[i].amountDebited + "</td><td>" + data[i].transactionType + "</td><td>" + data[i].noOfShares + "</td></tr>";

    		 $('#accountStatements > tbody:last').append(accountStatement);
    		}
    }});
  });
});
</script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class=""><a href="#">Inbox</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a id="myaccount" href="#"
						class="dropdown-toggle" data-toggle="dropdown">My Account<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a id="viewTransactions" href="#">View Transactions</a></li>
							<li><a href="#">View My Plan</a></li>
							<li><a href="#">Edit My Profile</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>

					<li><a href="#companyAssets">Company Assets</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<% User currentUser = (User) (session.getAttribute(ServletConstants.CURRENT_SESSION_USER));%>
					<li class="active"><a href="">Hi <%= currentUser.getUsername()%></a></li>
					<li><a href="../navbar-fixed-top/">Sign Out</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<!-- Not needed for now -->
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<div class="table-responsive">
						<table class="table table-striped" id="accountStatements">
							<thead>
								<tr>
									<th>TransactionDate</th>
									<th>AmountCredited</th>
									<th>AmountDebited</th>
									<th>TransactionType</th>
									<th>NoOfShares</th>
								</tr>
							</thead>
							<tbody id="accountStatements">
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<hr>
		<footer>
		<p>Cypher Future Group &copy; 2014</p>
		</footer>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>