$(document).ready(function() {
	$(function() {
		$("#tranDatepicker").datepicker();
	});
	
	$("#upload-transaction-file").click(function(e) {
		clearScreen();
		$("#upload-file-form").show();
	});

	$("#upload-file-form-not-used").submit(function(e) {
		e.preventDefault();

		var formURL = "AccountStatementServlet?method=uploadTransactions";
		$.ajax({
			cache : false,
			processData : false,
			contentType : false,
			data : $("#file").files,
			type : 'post',
			url : formURL,
			success : function(data) {
				var tabledata = JSON.stringify(data);
				alert(tabledata);
			}
		});
	});
	
	$("#update-transactions").click(function(e) {
		clearScreen();
		$(function() {
			$("#datepicker").datepicker();
		});
		
		$("#update-transactions-form").show();
		var getAllUsersResult = makeAjaxCall(
				'json',
				'application/x-www-form-urlencoded',
				'', 'UserProfileServlet',
				'getAllUsers', 'get');
		
		var getAllConfigsResult = makeAjaxCall(
				'json',
				'application/x-www-form-urlencoded',
				'', 'GeneralApi',
				'getAllConfigs', 'get');
		
		getAllUsersResult.success(function(data) {
			var options = document
					.getElementById("users");
			for (var i = 0, size = data.length; i < size; i++) {
				var opt = document
						.createElement('option');
				opt.value = data[i].username;
				opt.text = data[i].username;
				options
						.appendChild(opt);
			}
		});
		
		getAllConfigsResult.success(function(data) {
			var tranTypesOptions = document.getElementById("transactionTypes");
			var sharePrice = document.getElementById("sharePrice");

			for (var i = 0, size = data.length; i < size; i++) {
				var key = data[i].configKey;
				if(key=='TRANSACTION_TYPE') { 
					var opt = document.createElement('option');
					opt.value = data[i].configValue;
					opt.text = data[i].configValue;
					tranTypesOptions.appendChild(opt);
				} else if (key=='SHARE_PRICE') { 
					sharePrice.value = data[i].configValue;
				}
			}
		});
		
	});
	
	$("#update-transactions-form").submit(function(e) {
		e.preventDefault();

		var formURL = "GeneralApi";
		var users = this.users;
		var selectedUsers ='';
		for(userIndex = 0; userIndex< users.length; userIndex++) {
			
			var user = users[userIndex];
			if(user.selected) { 
				selectedUsers = selectedUsers + user.value + ",";
			} 
		}
		var method = "updateTransactions&";
		
		var transactionType = $("#transactionTypes :selected").text();
		var data = $(this).serialize() + "&usernames=" + selectedUsers + "&transactionType=" +
					transactionType;
		
		var updateTransactionsResult = makeAjaxCall(
				'json',
				'application/x-www-form-urlencoded',
				data, 'AccountStatementServlet',
				method, 'post');

		updateTransactionsResult.success(function(data) {
			$("#PostResponse").show();
		});
		
	});
	
	
	$("#view-all-transactions").click(
			function(e) {
				clearScreen();
				var formURL = "AccountStatementServlet";
				var method = "getAllTransactions";
				var result = makeAjaxCall('json',
						'application/x-www-form-urlencoded',
						'', formURL, method, 'get');
				result.success(function(data) {
					var tabledata = JSON.stringify(data);
					fillTransactionData(tabledata);
				});
			});

	function fillTransactionData(tabledata) {
		$('#genericTableId').bootstrapTable({
			columns : [ {
				field : 'username',
				title : 'User Name',
				sortable : true,
				editable : {
					type : 'text'
				} 
			}, {
				field : 'amountCredited',
				title : 'Amount Deposited',
				sortable : true,
				editable : {
					type : 'text'
				}
			}, {
				field : 'amountDebited',
				title : 'Amount Withdrawn'
			}, {
				field : 'transactionDate',
				title : 'Date Of Transaction',
				editable : {
					type : 'text'
				}
			}, {
				field : 'transactionType',
				title : 'Type of Transaction',
				editable : {
					type : 'text'
				}
			}, {
				field : 'noOfShares',
				title : 'Shares Alloted'
			} ],
			data : JSON.parse(tabledata)
		});
	} 
});