

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
    <title>Manage User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<style>
    #tb2
    {
        counter-reset: serial-number;  /* Set the serial number counter to 0 */
    }
    #tb2 td:first-child:before 
    {
        counter-increment: serial-number;  /* Increment the serial number counter */
        content: counter(serial-number);  /* Display the counter */
    }
    .results tr[visible='false'], .no-result{
        display: none;
    }
    .results tr[visible='true']{
        display: table-row;
    }
</style>

<body style="background-color: #cccccc">
    <jsp:include page="header.jsp"/>
    <div class="container-fluid">
        <div class="row">

            <div class="col-lg-3 p-0" style="background-color: #ffffff">
                <div style="height: 20px"></div>
                <div class="list-group">
                    <a href="candidate-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Candidate</span></a>       
                    <a href="interview-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Interview</span></a>
                    <a href="skill-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Skill</span></a>
                    <a href="position-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Position</span></a>
                    <a href="users" class="list-group-item list-group-item-action border-0 active"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>

            <div class="col-lg-9">
                <br>
                <div class="shadow-lg p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE USERS</b></h2>
                </div>

                <div class="float-right">
                    <form class="form-inline" action="#">
                        <input class="form-control mr-sm-2" type="text" placeholder="Enter key words">
                        <button class="btn btn-success" type="submit">Search</button>
                    </form>
                </div>

                <span class="counter pull-right"></span>
                <a class="btn btn-primary" href="user-add">Add New</a>
                <div style="height: 50px"></div>

                <c:if test="${not empty listUser}">
                    <table class="table table-hover table-striped" id="tb2">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Fullname</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <tr class="no-result">
                                <td colspan="4">No result </td>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="u" items="${listUser}">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>${u.username}</td>
                                    <td>${u.role}</td>
                                    <td>${u.fullname}</td>
                                    <td>${u.phone}</td>
                                    <td><c:if test="${u.enabled == 1}">
                                            <span class="badge badge-warning">Enabled</span>
                                        </c:if>
                                        <c:if test="${u.enabled == 0}">
                                            <span class="badge badge-danger">Disabled</span>
                                        </c:if></td>
                                    <td><a class="btn btn-primary" data-toggle="modal" data-target="#myModal${u.phone}">Update</a> 
                                        <a class="btn btn-danger" class="btn btn-danger" data-toggle="modal" data-toggle="tooltip" title="Delete" data-target="#removeModal${u.phone}">Delete</a>
                                    </td>

                                    <!-- The Modal: Remove -->
                            <div class="modal fade" id="removeModal${u.phone}">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Confirm</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            Do you want to delete this user <b>${u.fullname}</b>?
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <a class="btn btn-danger" href="remove-user?username=${u.username}">Yes</a>
                                            <button class="btn btn-secondary" data-dismiss="modal">No</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- 

                                    <!-- udate user -->                             
                            <div class="modal" id="myModal${u.phone}">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Update User</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <form:form class="form-horizontal" method="POST" modelAttribute="user" action="update-user">
                                            <div class="modal-body">
                                                <label><b>Username: ${u.username}</b></label><br> 

                                                <form:hidden path="username" value="${u.username}"/>                                                                

                                                <label><b>Password: </b></label>
                                                <form:input type="password" path="password" class="form-control" placeholer="${u.password}"/>
                                                
                                                <label><b>Role: </b></label>
                                                <form:select path="role" cssStyle="height: 35px" cssClass="form-control" placeholder="${u.role}">
                                                    <form:option value="admin">Adminnitration</form:option>
                                                    <form:option value="HR">Human Resource Management</form:option>
                                                    <form:option value="interviewee">Intervieweree</form:option>
                                                </form:select>

                                                <label><b>Fullname: </b></label>
                                                <form:input type="text" path="fullname" class="form-control"/>

                                                <label><b>Phone: </b></label>
                                                <form:input type="number" path="phone" class="form-control" placeholder="${u.phone}"/>

                                                <label><b>Email: </b></label>
                                                <form:input path="email" class="form-control" type="text" placeholder="${u.email}"/>

                                                <form:hidden path="enabled" value="0"/>
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-danger" value="Contact"/>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                                    
                            --%>

                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </c:if>
                <c:if test="${empty listUser}">
                    <div class="alert alert-danger">
                        List User is empty !
                    </div>
                </c:if>

                <br>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/> 

    <script>
        $(document).ready(function () {
            $("#search").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>