<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/Modify.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>      
<title>Level 2 Dashboard</title>
</head>
<body>
<!-- NAV -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  	<!-- Brand -->
  	<a class="navbar-brand" href="/">Trading Hub</a>
  	<ul class="navbar-nav">
    	<!-- Dropdown -->
    	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        		<c:out value = '${ currentUser.firstName }'/>
      		</a>
      		<div class="dropdown-menu">
        		<a class="dropdown-item" href="#">Settings</a>
        		<a class="dropdown-item" href="#">Profile</a>
        		<form id="logoutForm" method="POST" action="/logout">
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        		<input class="dropdown-item" type="submit" value="Logout!" />
	    		</form>
			</div>
		</li>
		<c:choose>
   			<c:when test = "${currentUser.level == 3}">
				<li class="nav-item">
	      		<a class="nav-link" href="/tasks">Tasks</a>
	      		</li>
			</c:when>
			<c:otherwise>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	        		Tasks
	      			</a>
	      			<div class="dropdown-menu">
	        			<a class="dropdown-item" href="#">Create a new Task</a>
	    				<a class="dropdown-item" href="#">Available Tasks</a>
	      			</div>	
      			</li>
			</c:otherwise>
   		</c:choose>
   		<li class="nav-item">
      		<a class="nav-link" href="/products">Products</a>
    	</li>
    	<li class="nav-item dropdown">
      	<c:choose>
   			<c:when test = "${currentUser.level<3}">
   				<li class="nav-item">
	      			<a class="nav-link" href="/products/add">Add Product</a>
		    	</li>
			</c:when>
   		</c:choose>
   		</li>
  	</ul>
</nav>
<!-- END OF NAV -->
<!-- BODY -->
<br>
<div class="row">
	<div class="col-sm-3">
		<div class="container">
			<div class="card border-dark mb-3" style="max-width: 18rem;">
		  		<div class="card-header"><h2> ${currentUser.firstName } ${currentUser.lastName } </h2></div>
			  	<br>
				<img alt="Badge photo" src="https://internal-cdn.amazon.com/badgephotos.amazon.com/?uid=${ currentUser.login}" style="margin:auto auto;">
			  	<div class="card-body">
		    		<h5 class="card-title "> ${currentUser.login }</h5>
		    		<p class="card-text"></p>
			  	</div>
			</div>
			<ul class="nav flex-column">
			</ul>
		</div>
	</div>
	<div class="col-sm-9">
  		<div class="container table-tasks">
		<h2>Pending Purchases</h2>
		<br>
			<div class="table-responsive">
				<table class="table">
			    	<thead>
			        	<tr>
			          		<th>Login</th>
			          		<th>Product</th>
			          		<th>Contact</th>
			          		<th>Action</th>
			        	</tr>
			      	</thead>
			      	<tbody>
					<c:forEach items="${ pendingPurchases }" var="purchase">
						<tr>
							<td>${ purchase.getUser().login }</td>
							<td>${ purchase.getProduct().name }</td>
							<td>${ purchase.getUser().login }@amazon.com</td>
							<td><a href="/purchases/${purchase.id}/delivered"><button>Delivered</button></a></td>
						</tr>
					</c:forEach>
			      	</tbody>
				</table>
			</div>
	  	</div>	
	</div>
</div>
</body>
</html>