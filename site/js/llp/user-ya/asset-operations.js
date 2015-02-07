$(document)	.ready(
				function() {
					
var transactions = '';
$("#viewTransactions")
		.click(
				function(e) {
					clearScreen();
					$("#genericFormId").show(); // show
					var columnNames = "<tr><th>TransactionDate</th><th>AmountCredited</th><th>AmountDebited</th><th>TransactionType</th><th>NoOfShares</th></tr>";
					$('#genericFormId > thead:last').append(columnNames);

					e.preventDefault();
					$.ajax({
						dataType : 'json',
						type : "GET",
						url : "AccountStatementServlet",
						success : function(data) {

							for (var i = 0, size = data.length; i < size; i++) {
								var accountStatement = "<tr><td>"
										+ data[i].transactionDate + "</td><td>"
										+ data[i].amountCredited + "</td><td>"
										+ data[i].amountDebited + "</td><td>"
										+ data[i].transactionType + "</td><td>"
										+ data[i].noOfShares + "</td></tr>";

								$('#genericFormId > tbody:last').append(
										accountStatement);
							}
						}
					});
				});

// once clicked on compansharePrices
$("#companySharePrices")
		.click(
				function(e) {
					clearScreen();
					$("#genericFormId").show(); // show
					var columnNames = "<tr><th>CompanySharePrice</th><th>SharePriceDate</th></tr>";
					$('#genericFormId > thead:last').append(columnNames);
					e.preventDefault();
					$('#genericFormId > tbody:last').append("");
					$.ajax({
						dataType : 'json',
						type : "GET",
						url : "SharePriceServlet",
						success : function(data) {

							for (var i = 0, size = data.length; i < size; i++) {
								var sharePrice = "<tr><td>"
										+ data[i].configValue + "</td><td>"
										+ data[i].configDate + "</td><tr>";

								$('#genericFormId > tbody:last').append(
										sharePrice);
							}
						}
					});
				});

// get company's all asset and their
// profit
$("#viewProfitLoss")
		.click(
				function(e) {
					clearScreen();
					$("#genericFormId").show(); // show
					// append column
					// names
					var columnNames = "<tr><th>AssetNo</th><th>AssetDescription</th><th>DateOfPurchase</th><th>PurchasedRate</th>"
							+ "<th>AssetRateParameter</th><th>AssetTypeName</th><th>TotalProfitInFigure</th><th>TotalProfitInPercentage</th></tr>";

					$('#genericFormId > thead:last').append(columnNames);
					e.preventDefault();
					$('#genericFormId > tbody:last').append("");
					$.ajax({
						dataType : 'json',
						type : "GET",
						url : "AssetInfoServlet",
						success : function(data) {
							for (var i = 0, size = data.length; i < size; i++) {
								var assetInfo = "<tr><td>" + data[i].assetNo
										+ "</td><td>" + data[i].description
										+ "</td><td>" + data[i].dateOfPurchase
										+ "</td><td>" + data[i].purchasedRate
										+ "</td><td>"
										+ data[i].assetRateParameter
										+ "</td><td>" + data[i].assetTypeName
										+ "</td><td>" + data[i].profitInFigure
										+ "</td><td>" + data[i].profitInPerc
										+ "</td><tr>";

								$('#genericFormId > tbody:last').append(
										assetInfo);
							}
						}
					});
				});

// get user Profile & update if this is
// required
//get user Profile & update if this is
//required
$("#editProfile")
		.click(
				function(e) {
					clearScreen();
					$("#user-profile-form").show();
					e.preventDefault();
					$
							.ajax({
								dataType : 'json',
								type : "GET",
								url : "UserProfileServlet",
								success : function(data) {
									document.getElementById('username').value = data.username;
									document.getElementById('password').value = data.passwprd;
									document.getElementById('emailId').value = data.emailId;
									document.getElementById('profession').value = data.profession;
									document.getElementById('mobileNo').value = data.mobileNo;
									document.getElementById('groupname').value = data.groupname;
									document.getElementById('address.line1').value = data.address.line1;
									document.getElementById('address.line2').value = data.address.line2;
									document.getElementById('address.city').value = data.address.city;
									document.getElementById('address.pincode').value = data.address.pincode;
								}
							});
				});
});