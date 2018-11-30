

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Position</title>
<style type="text/css">
body {
	background-size: cover;
	font-family: monospace;
	background-color: #99FF66	
	
}

hr {
	background: white;
}

.contact-form {
	background: rgba(0, 0, 0, .6);
	color: white;
	margin-top: 100px;
	padding: 20px;
	box-shadow: 0px 0px 10px 3px grey;
}
.form-area{
	height: 200px;
	background-color: powderblue;
}
</style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container contact-form">

	<div class="row">
            <div class="col-md-6">
                
            </div>
            <div class="col-md-6">
		<c:choose>
                    <c:when test="${not empty position.name}">
			<spring:url var="addPositionUrl" value="update-position" />
			<c:set var="title" value="Update Position" />
			<c:set var="titleBtn" value="Update" />
                    </c:when>
                    <c:otherwise>
			<spring:url var="addPositionUrl" value="create-position" />
			<c:set var="title" value="Add New Position" />
			<c:set var="titleBtn" value="Add" />
                    </c:otherwise>
		</c:choose>
                    <h1 style="margin-top: 10px">
			<c:out value="${title}" />
                    </h1>
                    <hr>
                    <div class="col-md-8">
                    
                        
			<form:form class="form-horizontal" method="POST" action="${addPositionUrl}">
                            <div class="form-group">
                                <label>Name:</label>
                                <form:hidden path="id" value="${position.id}" />
                                <form:input path="name" type="text" class="form-control" id="name" placeholder="Name" value="${position.name}" />
                            </div>
                            
                            <div class="form-group">
                                <label>Number of Process: </label>
                                <form:input path="process" type="number" class="form-control" id="process" rows="5" value="${position.process}" />
                            </div>
                                <form:hidden path="quantity" value="${position.quantity}" />
                            
                            <div class="form-group">
                                <label>Choose Skill:</label><br> 
                                <form:checkboxes items="${skillList}" path="skill" delimiter="<br>"/>
                            </div>
                                
                            <div class="row" style="margin-top: 10px">
                                <a href="position-list" class="btn btn-danger pull-left">Cancel</a>
                                <div style="width: 5px"></div>
                                <input type="submit" class="btn btn-primary pull-right" value="<c:out value = "${titleBtn}"/>">
                            </div>
                            
                        </form:form>
                        
                    </div>
            </div>
	</div>
    </div>
    <div class="col-md-4"></div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
