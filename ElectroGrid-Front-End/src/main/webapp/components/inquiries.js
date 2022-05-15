/*$(document).ready(function(){
	alert("Page Loaded");
});

//validations================================================================================================================================


function validatePaymentForm() {
	if ($("#inquiry_number").val().trim() == "") {
		return "Insert Name.";
	}
	if ($("#inquiry_date").val().trim() == "") {
		return "Insert Account_no.";
	}
	if ($("#inquiry_type").val().trim() == "") {
		return "Insert Amount.";
	}
	if ($("#inquiry_description").val().trim() == "") {
		return "Insert Card_no.";
			}
	



	return true;
}


// SAVE ============================================
$(document).on("click", "#addInquiry", function(event) { 
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide(); 
		
		// Form validation-------------------
		var status = validateInquiryForm(); if (status != true) {
			$("#alertError").text(status);
			$("#alertError").show();
				return;
		} $.ajax({
				url : "InquiryServlet",
				type : "post",
				data : $("#addformUser").serialize(),//??
				dataType : "text",
				complete : function(response, status) {
				onInquirySaveComplete(response.responseText, status);
			}
		});
});

function onInquirySaveComplete(response, status) {
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
	$("#hidInquiryIDSave").val("");
	$("#formInquiry
")[0].reset();

}*/
