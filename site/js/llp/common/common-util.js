/**
 * Checks if user is authenticated using cookie of user's credentials. 
 * @returns {Number}
 */
function isUserAuthenticated() {
	var allCookies = document.cookie.split(';');
	for (var i = 0; i < allCookies.length; i++) {
		var cookie = allCookies[i].split('=');
		if (cookie[0] == 'COOKIE_USERID' && cookie[1] != null) {
			return 1;
		}
	}
	return 0;
}

var isValidUser = isUserAuthenticated();
if (!isValidUser) {
	window.location.href = "signin.jsp";
}

/**
 * used to clean all divs which we are needed and remove all old data from them
 */
function clearScreen() {
	$("#user-profile-form").hide();
	
	$("#accountStatements").hide(); //hide transaction table on load
	$("#add-profile-form").hide();
	$("#search-profile-form").hide();
	$("#update-profile-form").hide();
	$("#comm-free-text-form").hide();
	$("#comm-free-text-div").hide();
	$("#add-asset-form").hide();
	$("#upload-file-form").hide();
	$("#update-transactions-form").hide();
	$("#create-plan-form").hide();
	$("#add-sharePrice-form").hide();
	
	$("#PostResponse").hide();
	clearTableContent();
}

function clearTableContent() {
	$("#genericFormId tbody").children().remove(); // will remove previous added elements from table
	$("#genericFormId thead").children().remove(); // will remove previous added elements from table
	$("#genericTableId tbody").remove(); // will remove previous added elements from table
	$("#genericTableId thead").remove();
	$("#permgroup").empty();
	$("#users").empty();
	$("#transactionTypes").empty();
	$('#genericTableId').bootstrapTable('destroy');
	$("#comm-free-text-div").value = "";
}

//function to make a ajax call given all inputs
function makeAjaxCall(dataType, contentType, data, url, method, callType) {
	return $.ajax({
		dataType : dataType,
		contentType : contentType,
		data : "method=" + method + data,
		type : callType,
		url : url
	});
}

function getEditSpan() {
	return '<button type="submit" class="btn btn-default"><span id="editSpanId" class=\"glyphicon glyphicon-edit\" aria-hidden=\"true\"/></button>';
}