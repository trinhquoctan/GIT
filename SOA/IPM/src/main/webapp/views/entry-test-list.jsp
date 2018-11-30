
<%@page import="com.fsoft.fa.ipm.model.Skill"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="com.fsoft.fa.ipm.model.RecruitmentDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
    <title>Interview Process Management</title>
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
                    <div class="dropdown">
                        <a href="candidate-list" class="dropdown list-group-item list-group-item-action border-0">
                            <span class="text-success">
                                <i class="fa fa-caret-square-o-down"></i> Manage Candidates
                            </span>
                        </a>
                        <div class="dropdown-content">
                            <a href="#" class="list-group-item list-group-item-action border-0">
                                <span class="text-success">
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
                    <a href="users" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>


            <div class="col-lg-9">
                <br>
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE ENTRY TEST</b></h2>
                </div>
                
                <div class="float-right">
                    <form class="form-inline" action="#">
                        <input class="form-control mr-sm-2" type="text" placeholder="Enter key words">
                        <button class="btn btn-success" type="submit">Search</button>
                    </form>
                </div>
                
                <span class="counter pull-right"></span>
                <a class="btn btn-primary" href="add-skill">Add new</a>
                <div style="height: 50px"></div>

                <c:if test="${not empty listMajor}">
                    <table class="table table-hover table-bordered table-striped text-center results" id="tb2">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Candidate</th>
                                <th>Round</th>
                                <th>Result</th>
                            </tr>
                            <tr class="no-result">
                                <td colspan="4">No result </td>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="a" items="${listMajor}">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>${a.name}</td>
                                    <td>${a.candidate_id}</td>
                                    <td>${a.round}</td>
                                    <td>${a.result}</td>
                                    <td><a class="btn btn-info" href="#">Detail</a> 
                                        <a class="btn btn-primary" href="edit-skill?id=${a.id}">Update</a> 
                                        <a class="btn btn-danger" href="delete-skill?id=${a.id}" class="link-delete">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                </c:if>
                <c:if test="${empty listMajor}">
                    <div class="alert alert-danger">
                        List Entry Test is empty !
                    </div>
                </c:if>
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
            $('.counter').text(jobCount + ' item');
            if (jobCount == 0) {
                $('.no-result').show();
            } else {
                $('.no-result').hide();
            }
        });
    });
</script>
