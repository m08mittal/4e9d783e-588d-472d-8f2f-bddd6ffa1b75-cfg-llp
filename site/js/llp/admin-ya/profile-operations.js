$(document).ready(function() {
	
	// get user Profile & update if this is required
	$("#add-profile-form").submit(
			function(e) {
				clearScreen();
				// get user profile and fill in the form
				e.preventDefault();
				var groupselected = $("#permgroups :selected").text();
				var formObj = $(this);
				var formURL = formObj.attr("action");
				var formData = new FormData(this);
				$("#genericFormId").show(); // show

				$.ajax({
					dataType : 'text',
					contentType : 'application/x-www-form-urlencoded',
					data : $(this).serialize()
							+ "&method=createProfile&groupname="
							+ groupselected,
					type : 'post',
					url : formURL,
					success : function(msg) {
						var profileForm = "<tr><td> " + "Updated Successfully"
								+ "</td></tr>";
						$('#genericFormId > tbody:last').append(profileForm);

					}
				});
			});
	
function updateProfile() {
	// init table use data
	var tableData = "tableData="
			+ JSON.stringify($('#genericTableId').bootstrapTable('getData'))
			+ "&method=saveByJsonData";
	alert(tableData);

	var formURL = "UserProfileServlet";
	$("#genericFormId").show(); // show

	$.ajax({
		dataType : 'text',
		data : tableData,
		type : 'post',
		url : formURL,
		success : function(msg) {
			var profileForm = "<tr><td> " + "Updated Successfully"
					+ "</td></tr>";
			$('#genericFormId > tbody:last').append(profileForm);

		}
	});

}

					// get user Profile & update if this is required
					$("#add-profile")
							.click(
									function(e) {
										clearScreen();
										$("#add-profile-form").show();
										var result = makeAjaxCall(
												'json',
												'application/x-www-form-urlencoded',
												'', 'GeneralApi',
												'getAllGroups', 'get');
										result
												.success(function(data) {
													var options = document
															.getElementById("permgroups");
													for (var i = 0, size = data.length; i < size; i++) {
														var opt = document
																.createElement('option');
														opt.value = data[i].groupname;
														opt.text = data[i].groupname;
														options
																.appendChild(opt);
													}

												});
									});

					$("#update-profile").click(function(e) {
						clearScreen();
						$("#search-profile-form").show();
					});

					$("#editSpanId").click(function(e) {
						clearScreen();
						updateProfile();
					});

					$("#update-profile-form").click(function(e) {
						e.preventDefault();
						updateProfile();
					});
					$("#search-profile-form")
							.submit(
									function(e) {
										e.preventDefault();
										clearScreen();
										$("#update-profile-form").show();
										// get user profile and fill in the form

										var formObj = $(this);
										var formURL = formObj.attr("action");
										var formData = $(this).serialize()
												+ '&method=searchByEmailId';

										$
												.ajax({
													dataType : 'json',
													contentType : 'application/x-www-form-urlencoded',
													data : formData,
													type : 'get',
													url : formURL,
													success : function(msg) {
														var tabledata = JSON
																.stringify(msg);
														fillData(tabledata);
													}
												});
									});

					function fillData(tabledata) {
						$('#genericTableId').bootstrapTable({
							columns : [ {
								field : 'username',
								title : 'Name',
								sortable : true,
								editable : {
									type : 'text'
								}
							}, {
								field : 'emailId',
								title : 'emailId'
							}, {
								field : 'profession',
								title : 'profession',
								editable : {
									type : 'text'
								}
							}, {
								field : 'mobileNo',
								title : 'mobileNo',
								editable : {
									type : 'text'
								}
							}, {
								field : 'address',
								title : 'address'
							} ],
							data : JSON.parse(tabledata)
						});
					}
});
