
<%@page import="com.fsoft.fa.ipm.model.Interview"%>
<%@page import="com.fsoft.fa.ipm.model.Skill"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="com.fsoft.fa.ipm.model.RecruitmentDetail" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>Interview Process Management</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color: #cccccc">
    <jsp:include page="header.jsp"/>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 p-0" style="background-color: #ffffff">
                <div style="height: 20px"></div>
                <div class="list-group">
                    <div class="dropdown">
                        <a href="candidate-list" class="dropdown list-group-item list-group-item-action border-0">
                            <span class="text-success">
                                <i class="fa fa-caret-square-o-down"></i> Manage Candidates
                            </span>
                        </a>
                        <div class="dropdown-content">
                            <a href="#" class="list-group-item list-group-item-action border-0 active">
                                <span class="text-white">
                                    <i class="fa fa-caret-square-o-down"></i> Manage Potential Candidates
                                </span>
                            </a>
                        </div>
                    </div>
                    <a href="major-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Major</span></a>
                    <a href="position-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Position</span></a>
                    <a href="skill-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Skill</span></a>
                    <a href="interview-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Interview</span></a>
                    <a href="#" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Recruitment Process</span></a>
                    <a href="#" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>

            <div class="col-lg-9">
                <br>
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE POTENTIAL CANDIDATE</b></h2>
                </div>

                <div class="float-right">
                    <form class="form-inline" action="#">
                        <input class="form-control mr-sm-2" id="search" type="text" placeholder="Search">
                    </form>
                </div>

                <div style="height: 50px"></div>

                <div class="shadow-sm p-4 mb-4 bg-white">
                    <c:if test="${not empty listCandidate}">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Full Name</th>
                                    <th>Phone Number</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <% int i = 1; %>
                            <tbody id="myTable">
                                <c:forEach var="a" items="${listCandidate}">
                                    <tr>
                                        <td><% out.print(i); i++; %></td>
                                        <td>${a.fullname}</td>
                                        <td>${a.phone}</td>
                                        <td>${a.email}</td>
                                        <td>
                                            <c:if test="${a.status == 'Pending'}">
                                                <span class="badge badge-warning">Pending</span>
                                            </c:if>
                                            <c:if test="${a.status == 'Fail'}">
                                                <span class="badge badge-danger">Fail</span>
                                            </c:if>
                                            <c:if test="${a.status == 'Pass'}">
                                                <span class="badge badge-success">Pass</span>
                                            </c:if>
                                            <c:if test="${a.status == 'InterviewProcess'}">
                                                <span class="badge badge-secondary">InterviewProcess</span>
                                            </c:if>
                                            <c:if test="${a.status == 'Inprocess'}">
                                                <span class="badge badge-info">Inprocess</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a class="btn btn-primary" data-toggle="modal" data-toggle="tooltip" title="Contact" data-target="#myModal${a.candidateID}">
                                                <i class="fa fa-phone" style="font-size:20px"></i>
                                            </a> 
                                            <a class="btn btn-danger" data-toggle="modal" data-toggle="tooltip" title="Delete" data-target="#removeModal${a.candidateID}">
                                                <i class="fa fa-close" style="font-size:20px"></i>
                                            </a>
                                        </td>
                                        <!-- The Modal -->
                                        <div class="modal fade" id="removeModal${a.candidateID}">
                                            <div class="modal-dialog modal-sm">
                                                <div class="modal-content">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Confirm</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        Do you want to delete <b>${a.fullname}</b> candidate?
                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <a class="btn btn-danger" href="delete-candidate?id=${a.candidateID}">Yes</a>
                                                        <button class="btn btn-secondary" data-dismiss="modal">No</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                <div class="modal" id="myModal${a.candidateID}">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Interview Datting</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <form:form class="form-horizontal" method="POST" modelAttribute="interview" action="create-interview-dating">
                                                <div class="modal-body">
                                                    <label><b>Name: ${a.fullname}</b></label><br> 

                                                    <form:hidden path="id"/>                                                                

                                                    <label><b>Date:</b></label>
                                                    <form:input type="date" path="date" class="form-control"/>

                                                    <label><b>Time:</b></label>
                                                    <form:input type="time" path="time" class="form-control"/>

                                                    <label><b>Location: </b></label>
                                                    <form:textarea path="location" class="form-control" id="location"></form:textarea>

                                                    <form:hidden path="candiateID" value="${a.candidateID}"/>

                                                    <label><b>Email of Creator: </b></label>
                                                    <form:input path="username" class="form-control" type="text" id="username"/>

                                                    <form:hidden path="result" value="-1"/>

                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <input type="submit" class="btn btn-primary" value="Contact"/>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>

                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                    </c:if>
                    <c:if test="${empty listCandidate}">
                        <div class="alert alert-danger">
                            List Candidate is empty !
                        </div>
                    </c:if>
                </div>
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