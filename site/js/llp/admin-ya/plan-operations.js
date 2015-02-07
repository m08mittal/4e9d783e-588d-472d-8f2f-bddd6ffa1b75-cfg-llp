$(document).ready(function() {
	$(function() {
		$("#planDatepicker").datepicker();
	});
	
	$("#update-plans").click(function(e) {
		clearScreen();
		$("#update-plans-form").show();
	});
	
	$("#create-plan").click(function(e) {
		clearScreen();
		$("#create-plan-form").show();
	});
	
	$("#create-plan-form").submit(function(e) {
		e.preventDefault();

		var formURL = "PlanServlet";
		var method = "createPlan&";
		var data = $(this).serialize();
		
		var updateTransactionsResult = makeAjaxCall(
				'json',
				'application/x-www-form-urlencoded',
				data, formURL,
				method, 'post');

		updateTransactionsResult.success(function(data) {
			$("#PostResponse").show();
		});
		
	});
	
	
	$("#view-all-plans").click(
			function(e) {
				clearScreen();
				var formURL = "PlanServlet";
				var method = "getAllPlans";
				var result = makeAjaxCall('json',
						'application/x-www-form-urlencoded',
						'', formURL, method, 'get');
				result.success(function(data) {
					var tabledata = JSON.stringify(data);
					fillPlanData(tabledata);
				});
			});

	function fillPlanData(tabledata) {
		$('#genericTableId').bootstrapTable({
			columns : [ {
				field : 'planName',
				title : 'Plan Name',
				sortable : true,
			}, {
				field : 'planDescription',
				title : 'Plan Description',
				sortable : true,
			}, {
				field : 'minInstallmentAmount',
				title : 'Min Installment Amount'
			}, {
				field : 'minInitialAmount',
				title : 'Min Initial Amount',
			}, {
				field : 'maxInstallmentAmount',
				title : 'Max Installment Amount',
			}, {
				field : 'maxInitialAmount',
				title : 'Max Initial Amount'
			} , {
				field : 'installmentPeriod',
				title : 'Installment Period'
			} ],
			data : JSON.parse(tabledata)
		});
	} 
});