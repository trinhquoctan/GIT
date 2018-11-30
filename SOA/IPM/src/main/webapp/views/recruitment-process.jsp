
<%@page import="com.fsoft.fa.ipm.model.EntryTest"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page import="com.fsoft.fa.ipm.model.Candidate"%>
<%@page import="java.util.List"%>
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
    <% 
        List<Candidate> listCandidate = (List<Candidate>) request.getAttribute("listCandidate");
        List<Position> listPosition = (List<Position>) request.getAttribute("listPosition");
        List<EntryTest> lstTest = (List<EntryTest>) request.getAttribute("lstTest");
    %>
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
                    <a href="entrytest-list" class="list-group-item list-group-item-action border-0 active"><span class="text-white"><i class="fa fa-caret-square-o-down"></i> Manage Recruitment Process</span></a>
                    <a href="#" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
                </div>
            </div>

            <div class="col-lg-9">
                <br>
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>MANAGE ENTRY TEST</b></h2>
                </div>

                <div class="form-group pull-right">
                    <input class="search form-control " id="search" type="text" placeholder="Search">
                </div>
                <div style="height: 20px"></div>
                
                    <div style="position: relative" data-spy="scroll" data-target=".link-position" data-offset="50">
                        <div class="link-position">
                            <div class="btn-group">
                                <% int i = 0;
                                for(Position p: listPosition) 
                                { %>
                                    <a href="#section<%= p.getId() %>" class="btn btn-secondary"><%= p.getName() %></a>
                                <% i++; if(i == 4) out.print("<br>"); }
                                %>
                            </div>
                        </div>
                            <div style="height: 20px"></div>   
                        <%
                        for(Position p: listPosition) 
                        { %>
                        
                        <div class="shadow-sm p-4 mb-4 bg-white">
                            <h4><%= p.getName() %></h4>
                            <div id="section<%= p.getId() %>" class="sec container-fluid">
                                
                                <table class="table table-hover table-striped table-bordered results text-center">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Candidate</th>
                                            <th>Round</th>
                                            <th>Result</th>
                                        </tr>
                                        <tr class="text-center no-result">
                                            <td colspan="3">No Result </td>
                                        </tr>
                                    </thead>
                                    <tbody id="myTable">
                                    <%
                                    for(EntryTest et: lstTest)
                                    {
                                        if(p.getId() == et.getPositionID())
                                        { %>
                                            <tr>
                                                <td><%= et.getName() %></td>
                                                <td>
                                                    <% 
                                                    for(Candidate c: listCandidate)
                                                    {
                                                        if(c.getCandidateID() == et.getCandidateID())
                                                        {
                                                            out.print(c.getFullname());
                                                            break;
                                                        }
                                                    }
                                                    %>
                                                </td>
                                                <td><%= et.getRound() %></td>
                                                <td>
                                                    <span class="badge badge-danger" style="font-size:20px; color:white"><%= et.getResult() %></span>
                                                    <button class="btn btn-primary"  data-toggle="modal" data-target="#resultModal<%= et.getId() %>"
                                                            href="#" data-toggle="tooltip" title="Update Result">
                                                        <i class="fa fa-edit" style="font-size:20px; color:white"></i>
                                                    </button>
                                                    
                                                    <!-- The Modal -->
                                                    <div class="modal fade" id="resultModal<%= et.getId() %>">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form:form class="form-horizontal" modelAttribute="entrytest" action="update-result" method="POST">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title">Update Entry Test Result</h4>
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <form:hidden path="id" value="<%= et.getId() %>" />
                                                                        <div class="form-group row">
                                                                            <label class="col-lg-3 col-form-label form-control-label">Enter result:</label>
                                                                            <div class="col-lg-9">
                                                                                <form:input class="form-control" rows="5" type="text" path="result" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <input type="submit" class="btn btn-primary" value="Update"> 
                                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                </form:form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        <% }
                                    }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <% }
                        %>
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