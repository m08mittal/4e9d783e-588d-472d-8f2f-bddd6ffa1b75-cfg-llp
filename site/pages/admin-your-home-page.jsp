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
<link rel="stylesheet"
	href="../bootstrap-table-master/src/bootstrap-table.css"></link>
<link rel="stylesheet"
	href="../bootstrap-editable/css/bootstrap-editable.css"></link>

<!-- Custom styles for this template -->
<link href="../css/navbar-static-top.css" rel="stylesheet">

<!--Java Scripts -->
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../bootstrap-table-master/src/bootstrap-table.js"></script>
<script src="../bootstrap-editable/js/bootstrap-editable.js"></script>
<script src="../js/llp/admin-ya/profile-operations.js"></script>
<script src="../js/llp/common/common-util.js"></script>
<script src="../js/llp/admin-ya/communication.js"></script>
<script src="../js/llp/admin-ya/asset-operations.js"></script>
<script src="../js/llp/admin-ya/transaction-operations.js"></script>
<script src="../js/llp/admin-ya/plan-operations.js"></script>
<script src="../js/llp/admin-ya/config-operations.js"></script>

<script
	src="../bootstrap-table-master/src/extensions/editable/bootstrap-table-editable.js"></script>

<script>
	clearScreen();
</script>
</head>
<body>

	<!-- Static navbar -->
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
					<li class="dropdown"><a id="transaction-operations" href="#"
						class="dropdown-toggle" data-toggle="dropdown">Transaction
							Operations<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a id="update-transactions" href="#">Update
									Transactions</a></li>

							<li><a id="view-all-transactions" href="#">View
									Transactions</a></li>

							<li><a id="upload-transaction-file" href="#">Upload
									Transactions</a></li>

						</ul></li>

					<li class="dropdown"><a id="profile-operations" href="#"
						class="dropdown-toggle" data-toggle="dropdown">Profile
							Operations<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a id="add-profile" href="#">Add Profile</a></li>
							<li><a id="update-profile" href="#">Update Profile</a></li>
						</ul></li>

					<li class="dropdown"><a id="asset-operations" href="#"
						class="dropdown-toggle" data-toggle="dropdown">Asset
							Operations<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a id="add-asset" href="#">Add Asset</a></li>
							<li><a id="update-assets" href="#">Update Assets</a></li>
						</ul></li>

					<li class="dropdown"><a id="configurations" href="#"
						class="dropdown-toggle" data-toggle="dropdown">Configurations<b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li class="divider"></li>
							<li class="dropdown-header">Plans</li>
							<li><a id="create-plan" href="#">Add Plan </a></li>
							<li><a id="view-all-plans" href="#">View All Plans </a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Share Prices</li>
							<li><a id="add-sharePrice" href="#">Add Share Price</a></li>
							<li><a id="view-all-sharePrices" href="#">View Share Prices</a></li>
						</ul></li>

					<li class="dropdown"><a id="communications" href="#"
						class="dropdown-toggle" data-toggle="dropdown">Communications<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a id="notify" href="#">Notify</a></li>
							<li><a id="news" href="#">News</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
					    User currentUser = (User) (session.getAttribute(ServletConstants.CURRENT_SESSION_USER));
					%>
					<li class="active"><a href="">Hi <%=currentUser.getUsername()%></a></li>
					<li><a href="LoginServlet?action=signout">Sign Out</a></li>
				</ul>
			</div>

			<!--/.nav-collapse -->
		</div>
		<!--/.container-fluid -->
	</div>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<!--  Communication data -->
				<textarea id="comm-free-text-div" class="form-control" rows="15"></textarea>
				<div class="clearfix"></div>
				<form id="comm-free-text-form" name="comm-free-text-form"
					class="form-inline" action="GeneralApi" method="post">
					<button id="free-text" type="submit" onclick="updateNews()"
						class="btn btn-default align-right">
						<span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>
					</button>
				</form>

				<table id="genericTableId"
					data-classes="table table-hover table-bordered "
					data-toolbar="filter-bar" data-search="true" data-height="299"
					data-pagination="true" data-cache="false">
				</table>
			</div>
			<!--  Save the user profile data -->
			<div class="col-md-offset-11">
				<form id="update-profile-form" name="update-profile-form"
					class="form-inline" action="UserProfileServlet" method="get">
					<button id="update-profile" type="submit"
						class="btn btn-default align-right">
						<span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>
					</button>
				</form>
			</div>
			<table class="table table-striped col-sm-3 col-md-2 sidebar"
				id="genericFormId">
				<tbody></tbody>
			</table>

			<!--  Create Asset Form  -->
			<form id="add-asset-form" name="add-profile-form"
				class="form-horizontal" action="AssetInfoServlet" method="POST"
				role="form">
				<div class="form-group">
					<label class="col-md-3 control-label">Asset No</label>
					<div class="col-md-4">
						<input class="form-control" id="assetNo" name="assetNo"
							type="text" placeholder="Asset No" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Description</label>
					<div class="col-md-4">
						<input class="form-control" id="description" name="description"
							type="text" placeholder="description" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Date Of Purchase</label>
					<div class="col-md-4">
						<input id="datepicker" class="form-control" name="dateOfPurchase"
							placeholder="12/12/1987" value="12/12/2014">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Purchased Rate</label>
					<div class="col-md-4">
						<input class="form-control" id="purchasedRate"
							name="purchasedRate" placeholder="00.00" value="00.00">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Asset Rate Parameter</label>
					<div class="col-sm-4">
						<input class="form-control" id="assetRateParameter"
							name="assetRateParameter" type="text"
							placeholder="Asset Rate Parameter">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Asset Type</label>
					<div class="col-sm-4">
						<input class="form-control" id="assetType" name="assetType"
							type="text" placeholder="Asset Type">
					</div>
					<div class="clearfix"></div>
					<button id="submit-asset" class="col-md-offset-5" type="submit"
						onclick="createAsset()"col-md-2btnbtn-default">Update</button>
				</div>
			</form>

			<form id="add-profile-form" name="add-profile-form"
				class="form-horizontal" action="UserProfileServlet" method="POST"
				role="form">
				<div class="form-group">
					<label class="col-md-3 control-label">Profile Name</label>
					<div class="col-md-4">
						<input class="form-control" id="username" name="username"
							type="text" placeholder="Profile Name" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">EmailId</label>
					<div class="col-md-4">
						<input class="form-control" id="emailId" name="emailId"
							type="text" placeholder="email-Id" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Profession</label>
					<div class="col-md-4">
						<input class="form-control" id="profession" name="profession"
							type="text" placeholder="Your Profession" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Profile Address</label>
					<div class="col-sm-4">
						<input class="form-control" id="address.line1"
							name="address.line1" type="text" placeholder="Line1">
					</div>
					<div class="clearfix"></div>
					<div class="col-md-offset-3 col-sm-4">
						<input class="form-control" id="address.line2"
							name="address.line2" type="text" placeholder="Line2">
					</div>
					<div class="clearfix"></div>
					<div class="col-md-offset-3 col-sm-4">
						<input class="form-control" id="address.pincode"
							name="address.pincode" type="text" placeholder="PineCode">
					</div>
					<div class="clearfix"></div>
					<div class="col-md-offset-3 col-sm-4">
						<input class="form-control" id="address.city" name="address.city"
							type="text" placeholder="City">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Contact No</label>
					<div class="col-md-4">
						<input class="form-control" id="mobileNo" name="mobileNo"
							type="text" placeholder="Contact No">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Choose Group</label>
					<!-- Group drop down -->
					<div class="col-md-2">
						<select id="permgroups" class="form-control col-md-3">
						</select>
					</div>

					<div class="clearfix"></div>
					<button id="submit-profile" class="col-md-offset-5" type="submit"col-md-2btnbtn-default">Update</button>
				</div>
			</form>

			<form id="search-profile-form" name="search-profile-form"
				class="form-inline" action="UserProfileServlet" method="get">
				<div class="form-group">
					<div class="input-group">
						<input class="form-control" id="emailId" name="emailId"
							type="text" placeholder="Enter EmailId" value="">
					</div>
				</div>
				<button id="search-profile" type="submit" class="btn btn-default">Search</button>
			</form>

			<!-- form to update configurations -->

			<!--  form to update transactions -->
			<form id="update-transactions-form" name="update-transactions-form"
				class="form-group" action="GeneralApi?method=updateTransactions"
				method="post">
				<label class="col-md-3 control-label">Transaction Amount</label>
				<div class="col-md-4">
					<input class="form-control" id="transactionAmount"
						name="transactionAmount" type="text"
						placeholder="Transaction Amount(+/-)" value="">
				</div>

				<div class="clearfix"></div>
				<label class="col-md-3 control-label">Latest Share Price</label>
				<div class="col-md-4">
					<input class="form-control" id="sharePrice" name="sharePrice"
						type="text" value="" readonly="readonly">
				</div>

				<div class="clearfix"></div>
				<label class="col-md-3 control-label">Transaction Type</label>
				<!-- Transaction Types drop down -->
				<div class="col-md-2">
					<select id="transactionTypes" class="form-control col-md-3">
					</select>
				</div>

				<div class="clearfix"></div>
				<label class="col-md-3 control-label">Date Of Transaction</label>
				<div class="col-md-4">
					<input id="tranDatepicker" class="form-control"
						name="dateOfTransaction" placeholder="12/12/1987"
						value="12/12/2014">
				</div>
				<div class="clearfix"></div>
				<label class="col-md-3 control-label">Select User(s)</label>
				<!-- Users drop down -->
				<div class="col-md-2">
					<select id="users" name="users" class="form-control col-md-3"
						multiple="multiple" size="10">
					</select>
				</div>

				<div class="clearfix"></div>
				<button id="submit-transactions" class="col-md-offset-6"
					type="submit"col-md-2btnbtn-default">Update</button>
			</form>

			<!--  form to upload the xls file to server -->
			<form id="upload-file-form" name="upload-file-form"
				class="form-inline form-group"
				action="AccountStatementServlet?method=uploadTransactions" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<input class="filestyle" id="file" name="file" type="file"
						size="40">
				</div>
				<button id="upload-file" type="submit" class="btn btn-default">Upload</button>
			</form>

			<!--  Create Plan form -->
			<form id="create-plan-form" name="add-profile-form"
				class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-md-3 control-label">Plan Name</label>
					<div class="col-md-4">
						<input class="form-control" id="planName" name="planName"
							type="text" placeholder="Plan Name" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Plan Description</label>
					<div class="col-md-4">
						<input class="form-control" id="planDescription" name="planDescription"
							type="text" placeholder="planDescription" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Min Initial Amount</label>
					<div class="col-md-4">
						<input class="form-control" id="minInitialAmount" name="minInitialAmount"
							type="text" placeholder="0">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Max Initial Amount</label>
					<div class="col-sm-4">
						<input class="form-control" id="maxInitialAmount"
							name="maxInitialAmount" type="text" placeholder="0">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Min Installment Amount</label>
					<div class="col-md-4">
						<input class="form-control" id="minInstallmentAmount" name="minInstallmentAmount"
							type="text" placeholder="0">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Max Installment Amount</label>
					<div class="col-md-4">
						<input class="form-control" id="maxInstallmentAmount" name="maxInstallmentAmount"
							type="text" placeholder="0">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Installment Perriod</label>
					<div class="col-md-4">
						<input class="form-control" id="installmentPeriod" name="installmentPeriod"
							type="text" placeholder="0">
					</div>
					<div class="clearfix"></div>
					<button id="submit-profile" class="col-md-offset-5" type="submit"col-md-2btnbtn-default">Create Plan</button>
				</div>
			</form>
			
			<!--  Create Share Price form -->
			<form id="add-sharePrice-form" name="add-sharePrice-form"
				class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-md-3 control-label">Share Price Value</label>
					<div class="col-md-4">
						<input class="form-control" id="configValue" name="configValue"
							type="text" placeholder="Share Price" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Date</label>
					<div class="col-md-4">
					<input id="configDate" class="form-control"
						name="configDate">
					</div>
					<div class="clearfix"></div>
					<button id="submit-profile" class="col-md-offset-5" type="submit"col-md-2btnbtn-default">Add Share Price</button>
				</div>
			</form>
			
			<div id="PostResponse" class="small h5">
				<p>Updated Successfully</p>
			</div>
			
		</div>
	</div>
	<div class="container">
		<hr>
		<footer>
		<p>Cypher Future Group &copy; 2014</p>
		</footer>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
</body>
</html>
