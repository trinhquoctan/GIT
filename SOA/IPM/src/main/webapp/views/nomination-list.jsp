<%-- 
    Document   : nomination-list
    Created on : Jul 29, 2018, 3:09:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>

<c:if test="${not empty lstCandidate}">
<table class="table table-hover table-bordered table-striped results" id="">
    <thead>
        <tr class="text-center">
            <th></th>
            <th>Candidate</th>
            <th>Add into Potential</th>
            <th>Action</th>
        </tr>
        <tr class="no-result">
            <td colspan="4">No result </td>
        </tr>
    </thead>
    <% int i = 1; %>
    <tbody id="myTable">
        <c:forEach var="a" items="${lstCandidate}">
            <tr>
                <td><% out.print(i); i++; %></td>
                <td class="text-left">${a.fullname}</td>
                <td><a class="btn btn-info" href="">Do</a></td>
                <td><a class="btn btn-primary" href=""><i class="fa fa-phone" style="font-size:20px"></i></a></td>
            </tr>
        </c:forEach>
    </tbody>

</table>
</c:if>