
<%@page import="com.fsoft.fa.ipm.model.Skill"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="com.fsoft.fa.ipm.model.RecruitmentDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
    <title>Manage Major</title>
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
                    <a href="candidate-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Candidates</span></a>
                    <a href="major-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Major</span></a>
                    <a href="skill-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Skill</span></a>
                    <a href="interview-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Interview</span></a>
                    <a href="#" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Recruitment Position</span></a>
                    <a href="#" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Recruitment Process</span></a>
                    <a href="users" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>


            <div class="col-lg-9">
                <br>
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE MAJOR</b></h2>
                </div>
                
                <div class="form-group pull-right">
                    <input class="search form-control " type="text" placeholder="Search here...">
                </div>
                <span class="counter pull-right"></span>
                <a class="btn btn-primary" href="major-add">Add new</a>
                <div style="height: 50px"></div>
            <div class="shadow-sm p-4 mb-4 bg-white">
                <c:if test="${not empty listMajor}">
                    <table class="table table-hover table-bordered table-striped results" id="">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Action</th>
                            </tr>
                            <tr class="text-center no-result">
                                <td colspan="3">No Result </td>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <% int i = 1; %>
                            <c:forEach var="a" items="${listMajor}">
                                <tr>
                                    <td><% out.print(i); i++; %></td>
                                    <td height ="120" width ="70%">${a.name}</td>
                                    <td>
                                        <a class="btn btn-primary" data-toggle="tooltip" title="Update" href="edit-major?name=${a.name}">
                                            <i class="fa fa-edit" style="font-size:20px; color:white"></i>
                                        </a> 
                                        <a class="btn btn-danger" data-toggle="modal" data-toggle="tooltip" title="Delete" data-target="#removeModal${a.id}">
                                            <i class="fa fa-close" style="font-size:20px"></i>
                                        </a>
                                    </td>
                                    <!-- The Modal -->
                                <div class="modal fade" id="removeModal${a.id}">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Confirm</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                Do you want to delete major <b>${a.name}</b>?
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <a class="btn btn-danger" href="delete-major?id=${a.id}">Yes</a>
                                                <button class="btn btn-secondary" data-dismiss="modal">No</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                </c:if>
                <c:if test="${empty listMajor}">
                    <div class="alert alert-danger">
                        List Major is empty !
                    </div>
                </c:if>
            </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $('.search').keyup(function () {
            var searchTerm = $(".search").val();
            var listItem = $('.results tbody').children('tr');
            var searchSplit = searchTerm.replace(/ /g, "'):containsi('");
            $.extend($.expr[':'], {
                'containsi': function (elem, i, match, array) {
                    return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                }
            });
            $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function () {
                $(this).attr('visible', 'false');
            });
            $(".results tbody tr:containsi('" + searchSplit + "')").each(function () {
                $(this).attr('visible', 'true');
            });
            var jobCount = $('.results tbody tr[visible="true"]').length;
            if (jobCount == 0) {
                $('.no-result').show();
            } else {
                $('.no-result').hide();
            }
        });
    });
</script>
