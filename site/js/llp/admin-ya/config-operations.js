$(document).ready(function() {
	$(function() {
		$("#configDate").datepicker();
	});
	
	$("#add-sharePrice").click(function(e) {
		clearScreen();
		$("#add-sharePrice-form").show();
		$('#configDate').val(new Date().toDateInputValue());
	});
	
	$("#add-sharePrice-form").submit(function(e) {
		e.preventDefault();
		
		var formURL = "GeneralApi";
		var method = "createConfig&";
		var data = $(this).serialize() + "&configKey=SHARE_PRICE&configType=SHARES";
		
		var addSharePriceResult = makeAjaxCall(
				'json',
				'application/x-www-form-urlencoded',
				data, formURL,
				method, 'post');

		addSharePriceResult.success(function(data) {
			$("#PostResponse").show();
		});
		
	});
	
	
	$("#view-all-sharePrices").click(
			function(e) {
				clearScreen();
				var formURL = "GeneralApi";
				var method = "getAllConfigs&configKey=SHARE_PRICE";
				var result = makeAjaxCall('json',
						'application/x-www-form-urlencoded',
						'', formURL, method, 'get');
				result.success(function(data) {
					var tabledata = JSON.stringify(data);
					
					fillSharePriceData(tabledata);
				});
			});

	function fillSharePriceData(tabledata) {
		$('#genericTableId').bootstrapTable({
			columns : [ {
				field : 'configKey',
				title : 'Share Price Key',
				sortable : true,
			}, {
				field : 'configValue',
				title : 'Share Price',
				sortable : true,
			}, {
				field : 'configDate',
				title : 'Date'
			} ],
			data : JSON.parse(tabledata)
		});
	} 
});