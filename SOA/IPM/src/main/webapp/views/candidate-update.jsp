<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update</h1>
        <form:form method="POST" modelAttribute="candidate" action="update-candidate" enctype="multipart/form-data">
            <form:hidden path="candidateID"/>
            Full Name: 
            <form:input path="fullname" id="fullname"/>
            
            <br/>
            Major:
            <form:input path="major" id="major"/>
            
            <br/>
            Birthday:
            <form:input type="date" path="birthday" id="birthday"/>
            
            <br/>
            Gender:
            <form:select items="${genderList}" path="gender" id="gender"/>
            
            <br/>
            Identity Card:
            <form:input path="idCard" id="idCard"/>
            
            <br/>
            Skill:
            <form:checkboxes items="${skillList}" path="skill" id="skill" delimiter="<br/>"/>
            
            <br/>
            Email:
            <form:input path="email" id="email"/>
            
            <br/>
            Status:
            <form:input path="status" id="status"/>
            
            <br/>
            Phone:
            <form:input path="phone" id="phone"/>
            <input type="submit" value="Submit"/>
        </form:form>
            
    </body>
</html>
