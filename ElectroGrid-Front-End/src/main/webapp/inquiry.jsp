<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="com.electrogrid.model.*" %>
<%@ page import="com.electrogrid.repository.*" %>

<%
InquiryRepository inquiryrepository=new InquiryRepository();
List<Inquiry> inquiries = inquiryrepository.getInquiries();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="views/bootstrap.min.css">
<link rel="stylesheet" href="views/inquiry.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="Component/inquiry.js"></script>

<meta charset="ISO-8859-1">

<title>Inquiry List</title>


</head>
<body>
<figure class="text-center">
	<blockquote class="blockquote">
		<h2><b>INQUIRY MANAGEMENT</b></h2>
	</blockquote>
	<figcaption class="blockquote-footer">
		MANAGE THE INQUIRY DETAILS
	</figcaption>
</figure>


<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b> Inquiry</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addInquiryModal" class="btn btn-success"  data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add Inquiry</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover"  id="displayInquiries">
				<thead>
					<tr>
						<th>Inquiry Number</th>
						<th>Date</th>
						<th>Type</th>
						<th>Description</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<%for (int recodeCount = 0; recodeCount < inquiries.size();recodeCount++){ %>
				<% Inquiry inquiry =inquiries.get(recodeCount); %>
			
					<tr>
<!-- 						<td> </td> -->
						<td><%= inquiry.getInquiry_number() %> </td>						
						<td><%= inquiry.getInquiry_date() %> </td>						
						<td><%= inquiry.getInquiry_type() %> </td>						
						<td><%= inquiry.getInquiry_description() %> </td>						
												
											
						
						<td>
							<a href="#editInquiryModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteInquiryModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
			
			
			
			<div class="clearfix">
				<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item active"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
			
			
			
		</div>
	</div>        
</div>

<!-- Edit Modal HTML -->
<div id="addInquiryModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Add Inquiry</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Inquiry Number</label>
						<input type="text" class="form-control"id = "inquiry_number" name = "inquiry_number"  required>
					</div>
					<div class="form-group">
						<label> Inquiry Date</label>
						<input type="text" class="form-control" id = "inquiry_date" name = "inquiry_date" required>
					</div>
					<div class="form-group">
						<label>Inquiry Type</label>
						<input type="text" class="form-control"id = "inquiry_type" name = "inquiry_type"  required>
					</div>
					<div class="form-group">
						<label>Inquiry Description</label>
						<input type="text" class="form-control"id = "inquiry_description" name = "inquiry_description"  required>
					</div>		
					
				</div>
				
			</form>
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editInquiryModal" name = "editInquiryModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="editformInquiry" name="editformInquiry">>
				<div class="modal-header">						
					<h4 class="modal-title">Edit Inquiry</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Inquiry Number</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Inquiry Date</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Inquiry Type</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Inquiry Description</label>
						<input type="text" class="form-control" required>
					</div>
								
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteInquiryModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Delete Inquiry</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete" >
					 
				</div>
			</form>
		</div>
	</div>
</div>


</body>
</html>