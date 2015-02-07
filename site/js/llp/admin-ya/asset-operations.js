$(document)
		.ready(
				function() {
					// get user Profile & update if this is required
					$("#add-asset-form")
							.submit(
									function(e) {
										// get user profile and fill in the form
										e.preventDefault();
										var formObj = $(this);
										var formURL = formObj.attr("action");
										var formData = $(this).serialize()
												+ "&method=createAsset";
										alert(formData);
										$("#genericFormId").show(); // show

										$
												.ajax({
													dataType : 'text',
													contentType : 'application/x-www-form-urlencoded',
													data : formData,
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

														$("#add-asset-form")
																.hide();
													}
												});
									});

					// date picker for date column
					$(function() {
						$("#datepicker").datepicker();
					});

					$("#add-asset").click(function(e) {
						clearScreen();
						$("#add-asset-form").show();
					});

					$("#update-assets").click(
							function(e) {
								clearScreen();
								var formURL = "AssetInfoServlet";
								var method = "getAllAssets";
								var result = makeAjaxCall('json',
										'application/x-www-form-urlencoded',
										'', formURL, method, 'get');
								result.success(function(data) {
									var tabledata = JSON.stringify(data);
									fillData(tabledata);
								});
							});

					function fillData(tabledata) {
						$('#genericTableId').bootstrapTable({
							columns : [ {
								field : 'assetNo',
								title : 'Asset No',
								sortable : true,
								editable : {
									type : 'text'
								}
							}, {
								field : 'description',
								title : 'Description'
							}, {
								field : 'dateOfPurchase',
								title : 'Date Of Purchase',
								editable : {
									type : 'text'
								}
							}, {
								field : 'purchasedRate',
								title : 'Purchased Rate',
								editable : {
									type : 'text'
								}
							}, {
								field : 'assetRateParameter',
								title : 'Asset Rate Parameter(in Yard)'
							}, {
								field : 'assetTypeName',
								title : 'Asset Type'
							} ],
							data : JSON.parse(tabledata)
						});
					}

				});