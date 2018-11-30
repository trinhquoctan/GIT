
<%@page import="com.fsoft.fa.ipm.model.Candidate"%>
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
    <title>Manage Interview</title>
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
                    <a href="interview-list" class="list-group-item list-group-item-action border-0 active"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Interview</span></a>
                    <a href="skill-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Skill</span></a>
                    <a href="position-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Position</span></a>
                    <a href="users" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>


            <div class="col-lg-9">
                <br>
                
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE INTERVIEW</b></h2>
                </div>

                <div class="float-right">
                    <input class="form-control mr-sm-2" type="text" id="search" placeholder="Enter key words">
                </div>
                
                <div style="height: 50px"></div>
            <div class="shadow-sm p-4 mb-4 bg-white">
                <c:if test="${not empty listInterviews}">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Location</th>
                                <th>Interviewer</th>
                                <th>Candidate</th>
                                <th>Result</th>
                                <th>Action</th>
                            </tr>
                            <tr class="no-result">
                                <td colspan="4">No result </td>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="a" items="${listInterviews}">
                                <tr>
                                    <c:set var="dateString" value="${a.date}" scope="request"/>
                                    <% 
                                        String d = (String) request.getAttribute("dateString");
                                        String[] r = d.contains("-") ? d.split("-") : d.split("/");
                                        String result = "";
                                        for(int i = r.length-1; i >= 0; i--)
                                        {
                                            result += r[i];
                                            if(i != 0) result += "-";
                                        }
                                    %>
                                    <td><%= result %></td>
                                    <c:set var="timeString" value="${a.time}" scope="request"/>
                                    <% 
                                        String t = (String) request.getAttribute("timeString");
                                        String time = t.substring(0, t.lastIndexOf(":"));
                                    %>
                                    <td><%= time %></td>
                                    <td>${a.location}</td>
                                    <td>${a.username}</td>
                                    <c:set var="IDcandidate" value="${a.candiateID}" scope="request"/>
                                    <% 
                                        Candidate cd = null;
                                        int id = Integer.parseInt(request.getAttribute("IDcandidate").toString());
                                        List<Candidate> lst = (List<Candidate>) request.getAttribute("listCandidates");
                                        if(lst != null)
                                        {
                                            for(Candidate c: lst)
                                            {
                                                if(id == c.getCandidateID()) 
                                                {
                                                    cd = c; 
                                                    break;
                                                }
                                            }
                                        }
                                    %>
                                    <td><% out.print(cd == null ? id : cd.getFullname()); %></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty a.result}"><c:out value="${a.result}"/></c:when>
                                            <c:otherwise><c:out value="N/A"/></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary" data-toggle="modal" data-toggle="tooltip" title="Update" data-target="#editModal${a.id}">
                                            <i class="fa fa-edit" style="font-size:20px; color:white"></i>
                                        </a> 
                                        <a class="btn btn-danger" data-toggle="modal" data-toggle="tooltip" title="Delete" data-target="#removeModal${a.id}">
                                            <i class="fa fa-close" style="font-size:20px"></i>
                                        </a>
                                    </td>
                                    <!-- The Delete Modal -->
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
                                                Do you want to delete contact of <b>this</b> contact?
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <a class="btn btn-danger" href="delete-interview?id=${a.id}">Yes</a>
                                                <button class="btn btn-secondary" data-dismiss="modal">No</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--The Edit Modal-->
                                <div class="modal" id="editModal${a.id}">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Update Result</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <form:form class="form-horizontal" method="POST" modelAttribute="interview" action="update-interview">
                                                <div class="modal-body">
                                                    
                                                    <form:hidden path="id"/>                                                                


                                                    <form:hidden  path="date" value="${a.date}"/>


                                                    <form:hidden  path="time" value="${a.time}"/>


                                                    <form:hidden path="location" value="${a.location}"/>

                                                    <form:hidden path="candiateID" value="${a.candiateID}"/>


                                                    <form:hidden path="username" value="${a.username}"/>

                                                    <label><b>Result: </b></label>
                                                    <form:textarea path="result" class="form-control" placeholder="${a.result}"></form:textarea>

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
                <c:if test="${empty listInterviews}">
                    <div class="alert alert-danger">
                        List Interview is empty !
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
        $(document).ready(function () {
            $("#search").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
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
</script>
