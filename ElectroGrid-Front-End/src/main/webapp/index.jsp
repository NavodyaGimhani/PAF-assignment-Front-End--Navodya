<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>


<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Component/jquery-3.2.1.min.js"></script>
<script src="Component/main.js"></script>
<script src="Component/jquery.min.js"></script>
<link rel="stylesheet" href="Views/bootstrap.min.css">
</head>
<body>
     
     <h1 align="center"> Inquiry Details </h1>
     <div class="row">
        <div class="col-lg-12">
          <div class="card m-b-32">
          <div class="card-body">
          
             <form id="formuser" name="formuser" method="post"
              action="index.jsp">
                <br><label>  Inquiry Number: </label>
                <input id="name" name="name" type="text"
                  class="form-control form-control-sm">
                  
                  <br><label>Inquiry Date : </label>
                    <input id="account_no" name="account_no" type="text"
                  class="form-control form-control-sm">
             
                     <br><label> Inquiry Type: </label>
                    <input id="amount" name="amount" type="text"
                  class="form-control form-control-sm">
                  
                   <br><label>Inquiry Description: </label>
                    <input id="card_no" name="card_no" type="text"
                  class="form-control form-control-sm">
                  
                    <br><label>Security Code : </label>
                    <input id="security_code" name="security_code" type="text"
                  class="form-control form-control-sm">
                  
                   
                  
                  
                  <br>
                   <input id="btnSave" name="btnSave" type="button" value="Save"
            class="btn-btn-primary"><input type="hidden"
            id="hididSave" name="hididSave" value="">
          
                  
             </form>
          <br>
          <div id="alertSuccess" class="alert alert-success"> </div>
          <div id="alertError" class="alert alert-danger"></div>
          <br> <br>
          
         
           
          </div>
            
          </div>
        
        </div>
         
     </div>
    
</body>
</html>