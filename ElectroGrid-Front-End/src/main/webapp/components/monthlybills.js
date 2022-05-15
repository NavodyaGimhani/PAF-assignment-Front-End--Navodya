/*$(document).ready(function(){
	alert("Page Loaded");
});

//validations================================================================================================================================


function validatePaymentForm() {
	if ($("#account_number").val().trim() == "") {
		return "Insert Account Number.";
	}
	if ($("#date").val().trim() == "") {
		return "Insert  Bill Date.";
	}
	if ($("#no_of_units").val().trim() == "") {
		return "Insert Number Of Units.";
	}
	if ($("#charge_of_the_month").val().trim() == "") {
		return "Insert Charge of the month.";
			}
	if ($("#total_amount").val().trim() == "") {
		return "Insert Amount.";
			}
	
	



	return true;
}


// SAVE ============================================
$(document).on("click", "#addMonthlyBill", function(event) { 
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide(); 
		
		// Form validation-------------------
		var status = validateMonthlyBillForm(); if (status != true) {
			$("#alertError").text(status);
			$("#alertError").show();
				return;
		} $.ajax({
				url : "MonthlyBillServlet",
				type : "post",
				data : $("#addformUser").serialize(),//??
				dataType : "text",
				complete : function(response, status) {
				onMonthlyBillSaveComplete(response.responseText, status);
			}
		});
});

function onMonthlyBillSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {	
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidMonthlyBillIDSave").val("");
	$("#formMonthlyBill")[0].reset();

}*/
