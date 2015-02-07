$(document).ready(function() {
	clearScreen();
	// get user Profile & update if this is required
	$("#user-profile-form").submit(
			function(e) {
				// get user profile and fill in the
				// form
				clearScreen();
				e.preventDefault();
				var formURL = "UserProfileServlet";
				$("#genericFormId").show(); // show

				$
						.ajax({
							dataType : 'text',
							contentType : 'application/x-www-form-urlencoded',
							data : $(this).serialize() ,
							type : 'post',
							url : formURL,
							success : function(msg) {
								var profileForm = "<tr><td> "
										+ "Updated Successfully"
										+ "</td></tr>";
								$(
										'#genericFormId > tbody:last')
										.append(
												profileForm);

							}
						});
			});
	
	
	$("#viewMyPlan")
	.click(
			function(e) {
				clearScreen();
				$("#genericFormId").show(); // show
				var columnNames = "<tr><th>Plan Name</th><th>Plan Description</th><th>Min Initial Amount</th><th>Max Initial Amount</th>" +
						"<th>Installment Period (Months)</th><th>Min Installment Amount</th><th>Max Installment Amount</th></tr>";
				$('#genericFormId > thead:last').append(columnNames);

				e.preventDefault();
				$.ajax({
					dataType : 'json',
					type : "GET",
					url : "PlanServlet",
					data : "method=getMyPlan",
					success : function(data) {
							var plan = "<tr><td>"
									+ data.planName + "</td><td>"
									+ data.planDescription + "</td><td>"
									+ data.minInitialAmount + "</td><td>"
									+ data.maxInitialAmount + "</td><td>"
									+ data.installmentPeriod + "</td><td>"
									+ data.minInstallmentAmount + "</td><td>"
									+ data.maxInstallmentAmount + "</td></tr>";

							$('#genericFormId > tbody:last').append(
									plan);
					}
				});
			});
	
	
	$("#user-inbox").click(
			function(e) {
				clearScreen();
				var result = makeAjaxCall('json',
						'application/x-www-form-urlencoded', '',
						'GeneralApi', 'getNews', 'get');
				result.success(function(data) {
					$("#comm-free-text-div").show();

					data = JSON.stringify(data);
					var textarea = document
							.getElementById("comm-free-text-div");
					textarea.value = data;
					textarea.text = news;
				});
			});
});