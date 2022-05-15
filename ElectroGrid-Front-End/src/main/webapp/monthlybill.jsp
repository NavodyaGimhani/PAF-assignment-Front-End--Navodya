<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="com.electrogrid.model.*" %>
<%@ page import="com.electrogrid.repository.*" %>

<%
MonthlyBillRepository monthlybillrepository=new MonthlyBillRepository();
List<MonthlyBill> monthlybills = monthlybillrepository.getMonthlyBill();//add s

MonthlyBill monthlybillValueRow = new MonthlyBill();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="views/bootstrap.min.css">
<link rel="stylesheet" href="views/monthlybill.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="Component/inquiries.js"></script>

<meta charset="ISO-8859-1">

<title>Monthly Bill List</title>


</head>
<body>
<figure class="text-center">
	<blockquote class="blockquote">
		<h2><b>MONTHLYBILL MANAGEMENT</b></h2>
	</blockquote>
	<figcaption class="blockquote-footer">
		MANAGE THE MONTHLYBILL DETAILS
	</figcaption>
</figure>


<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b> MonthlyBill</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addMonthlyBillModal" class="btn btn-success"  data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New MonthlyBill</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover"  id="displayMonthlyBills">
				<thead>
					<tr>
						<th>Account Number</th>
						<th>Date</th>
						<th>Number Of Units</th>
						<th>Charge of the Month</th>
						<th>Total Amount</th>						
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<%for (int recodeCount = 0; recodeCount < monthlybills.size();recodeCount++){ %>
				<% MonthlyBill monthlybill = monthlybills.get(recodeCount); %>
				
					<tr>
<!-- 						<td> </td> -->
						<td><%= monthlybill.getAccount_number() %> </td>						
						<td><%= monthlybill.getDate() %> </td>						
						<td><%= monthlybill.getNo_of_units() %> </td>						
						<td><%= monthlybill.getCharge_of_the_month() %> </td>						
						<td><%= monthlybill.getTotal_amount() %> </td>						
											
						
						<td>
							<a href="#editMonthlyBillModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteMonthlyBillModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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

<!-- Add Modal HTML -->
<div id="addMonthlyBillModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Add MonthlyBill</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Account Number</label>
						<input type="text" class="form-control" id = "account_number" name = "account_number"required>
					</div>
					<div class="form-group">
						<label>Date</label>
						<input type="text" class="form-control" id = "date" name = "date"required>
					</div>
					<div class="form-group">
						<label>Number Of Units</label>
						<input type="text" class="form-control" id = "no_of_units" name = "no_of_units"required>
					</div>
					<div class="form-group">
						<label>Charge Of The Month</label>
						<input type="text" class="form-control" id = "charge_of_the_month" name = "charge_of_the_month"required>
					</div>		
					<div class="form-group">
						<label>Total Amount</label>
						<input type="text" class="form-control" id = "total_amount" name = "total_amount"required>
					</div>	
											
				</div>
				
			</form>
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editMonthlyBillModal" name = "editMonthlyBillModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="editformMonthlyBill" name="editformMonthlyBill">>
				<div class="modal-header">						
					<h4 class="modal-title">Edit MonthlyBill</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Account Number</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Date</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Number Of Units</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Charge Of The Month</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Total Amount</label>
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
<div id="deleteMonthlyBillModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Delete MonthlyBill</h4>
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