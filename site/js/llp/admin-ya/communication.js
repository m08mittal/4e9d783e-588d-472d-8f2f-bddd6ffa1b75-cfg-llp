$(document).ready(function() {
	// get user Profile & update if this is required
	$("#comm-free-text-form").submit(
			function(e) {
				// get user profile and fill in the form
				e.preventDefault();
				var commText = "comm-data=" + document
				.getElementById("comm-free-text-div").value;
				alert(commText);

				$.ajax({
					dataType : 'text',
					contentType : 'application/x-www-form-urlencoded',
					data : commText + "&method=updateNews",
					type : 'post',
					url : 'GeneralApi',
					success : function(msg) {
						$('#comm-free-text-div').value = msg;
					}
				});
			});
	
			clearScreen();
			$("#news").click(
					function(e) {
						clearScreen();
						$("#comm-free-text-div").show();
						var result = makeAjaxCall('json',
								'application/x-www-form-urlencoded', '',
								'GeneralApi', 'getNews', 'get');
						result.success(function(data) {
							data = JSON.stringify(data);
							var textarea = document
									.getElementById("comm-free-text-div");
							textarea.value = data;
							textarea.text = news;

							$("#comm-free-text-form").show();
						});
					});

});