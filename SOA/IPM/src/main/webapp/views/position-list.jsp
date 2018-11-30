
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<link href="resources/themes/lbd/assets/css/bootstrap.min.css"
      rel="stylesheet" type="text/css" />
<script src="resources/themes/lbd/assets/js/jquery-1.10.2.js"
type="text/javascript"></script>

<head>
    <title>File Management</title>
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
    <jsp:include page="header.jsp" />

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 p-0" style="background-color: #ffffff">
                <div style="height: 20px"></div>

                <!--iframe id="list" src="category.jsp" width="100%" height="100%" frameborder="0"></iframe-->
                <div class="list-group">
                    <a href="candidate-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Candidate</span></a>       
                    <a href="interview-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Interview</span></a>
                    <a href="skill-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Skill</span></a>
                    <a href="position-list" class="list-group-item list-group-item-action border-0 active"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Position</span></a>
                    <a href="users" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>

            <div class="col-lg-9">
                <br>
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE POSITION</b></h2>
                </div>

                <div class="form-group pull-right">
                    <input class="search form-control " type="text" placeholder="Search here...">
                </div>
                <span class="counter pull-right"></span>
            <% if(request.getAttribute("lstCandidate") == null) { %>
                <a class="btn btn-primary" href="position-add">Add new</a>
            <% } %>
                <div style="height: 50px"></div>
                <div class="shadow-sm p-4 mb-4 bg-white">
            <% if(request.getAttribute("lstCandidate") == null) { %>
                <c:if test="${not empty listPositions}">
                    <table class="table table-hover table-bordered table-striped text-center results" id="">
			<thead>
                            <tr>
				<th></th>
				<th>Name</th>
				<th>Num of Round</th>
				<th>Total of Quantity</th>
				<th></th>
				<th>Action</th>
                            </tr>
                            <tr class="no-result">
				<td colspan="4">No result </td>
                            </tr>
			</thead>
			<tbody id="myTable">
                            <% int i = 1; %>
                            <c:forEach var="a" items="${listPositions}">
				<tr>
                                    <td><% out.print(i); i++; %></td>
                                    <td class="text-left">${a.name}</td>
                                    <td>${a.process}</td>
                                    <td>${a.quantity}</td>
                                    <td>
                                        <a class="btn btn-info"href="list-nomination?id=${a.id}"
                                           style="color:white" >Nominate</a>
                                    </td>
                                    <!-- The Modal
                                    <div class="modal fade" id="myModal${a.id}">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="text-center modal-header">
                                                    <h4 class="modal-title"><b>Position: ${a.name}</b></h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <a href="#" class="btn btn-info" onclick="loadListNomination(${a.id})">Show</a>
                                                    <div id="list-nomination"></div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <td>
                                        <a class="btn btn-primary" data-toggle="tooltip" title="Update" href="edit-position?id=${a.id}">
                                            <i class="fa fa-edit" style="font-size:20px; color:white"></i>
                                        </a> 
                                        <a class="btn btn-danger" data-toggle="modal" data-toggle="tooltip" title="Delete" data-target="#removeModal${a.id}">
                                            <i class="fa fa-close" style="font-size:20px"></i>
                                        </a>
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
                                                    <div class="modal-body text-left">
                                                        Do you want to delete <b>${a.name}</b> position?
                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <a class="btn btn-danger" href="delete-position?id=${a.id}">Yes</a>
                                                        <button class="btn btn-secondary" data-dismiss="modal">No</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    
                                </tr>
                            </c:forEach>
			</tbody>

                    </table>
		</c:if>
                <c:if test="${empty listPositions}">
                    <div class="alert alert-danger">
                        List Positions is empty !
                    </div>
                </c:if>
                
            <% } else { %>
            <div class="card h-80">
                <div class="card-body">
                    <h4 class="card-title text-center">Position: <b><c:out value="${position.name}"/></b></h4>
                    
                    <p class="card-text" style="font-size: 14px">
                        <h5>Skill Required: 
                            <c:forEach var="s" items="${lstSkill}">
                                <span class="badge badge-success">${s.name}</span>
                            </c:forEach>
                        </h5>
                        <div style="height: 10px"></div>
                        <table class="table table-hover table-bordered table-striped results text-center" id="">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Potential Candidate</th>
                                    <th>Add into Potential</th>
                                    <th>Action</th>
                                </tr>
                                <tr class="no-result">
                                    <td colspan="4">No Result </td>
                                </tr>
                            </thead>
                            <% int i = 1; %>
                            <tbody id="myTable">
                                <c:forEach var="a" items="${lstCandidate}">
                                    <tr>
                                        <td><% out.print(i); i++; %></td>
                                        <td class="text-left">${a.fullname}</td>
                                        <td><a class="btn btn-info" href="add-into-potential?pos=${position.id}&can=${a.candidateID}">Do</a></td>
                                        <td>
                                            <a class="btn btn-primary" data-toggle="modal" data-toggle="tooltip" title="Contact" data-target="#myModal${a.candidateID}">
                                                <i class="fa fa-phone" style="font-size:20px"></i>
                                            </a> 
                                        </td>
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
                    </p>
                </div>
                            
                            <a href="position-list" class="pull-left btn btn-secondary"><span class="text-white">Back</span></a>
            </div>
                        
            <% } %>
                </div>
            </div>

        </div>
    </div>

</div>

<jsp:include page="footer.jsp" />
</body>
<script>
    $(document).ready(function(){
        $('.search').keyup(function(){
            var searchTerm = $(".search").val();
            var listItem = $('.results tbody').children('tr');
            var searchSplit = searchTerm.replace(/ /g, "'):containsi('");
            $.extend($.expr[':'],{
                'containsi': function(elem,i,match,array){
                    return (elem.textContent || elem.innerText|| '').toLowerCase().indexOf((match[3] ||"").toLowerCase())>=0;
                }
            });
            $(".results tbody tr").not(":containsi('"+searchSplit + "')").each(function(){
                $(this).attr('visible','false');
            });
            $(".results tbody tr:containsi('"+searchSplit+"')").each(function(){
                $(this).attr('visible','true');
            });
            var jobCount = $('.results tbody tr[visible="true"]').length;
            if(jobCount == 0){
                $('.no-result').show();
            }else{
                $('.no-result').hide(); 
            }
        }) ;
    });
</script>