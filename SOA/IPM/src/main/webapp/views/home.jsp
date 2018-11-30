
<%@page import="com.fsoft.fa.ipm.model.PositionDetail"%>
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

<body style="background-color: #cccccc">
<jsp:include page="header.jsp"/>
<%
    //request.getAttribute("list")
    List<RecruitmentDetail> list = null;
    RecruitmentDetail recruit = null;
    if(request.getAttribute("list") != null)
    {
        list = (ArrayList<RecruitmentDetail>) request.getAttribute("list");
    } 
    else if(request.getAttribute("recruit") != null) {
        recruit = (RecruitmentDetail) request.getAttribute("recruit");
    }
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 p-0" style="background-color: #ffffff">
            <div style="height: 20px"></div>
                
            <!--iframe id="list" src="category.jsp" width="100%" height="100%" frameborder="0"></iframe-->
            
            <div class="list-group">
                <a href="candidate-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Candidates</span></a>
                <a href="interview-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Interview</span></a>
                <a href="skill-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Skill</span></a>
                <a href="position-list" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Position</span></a>
                <a href="users" class="list-group-item list-group-item-action border-0"><span class="text-success"><i class="fa fa-caret-square-o-down"></i> Manage Users</span></a>
            </div>
        </div>
        
        
        <div class="col-lg-9">
            <br>
            <% if(request.getAttribute("recruit") == null) { %>
            <div class="shadow-sm p-4 mb-4 bg-white">
                <h2 class="text-danger text-center"><b>ANNOUNCEMENT</b></h2>
            </div>
            
            <div class="float-right">
                <form class="form-inline" action="search-recruit" method="POST">
                    <input class="form-control mr-sm-2" name="key" type="text" placeholder="Enter key words">
                    <input class="btn btn-success" type="submit" value="Search">
                </form>
            </div>
            
            <div class="container">
                <form action="home" method="GET">
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label form-control-label">Sort by: </label>
                        <div class="col-lg-4">
                            <label class="custom-file">
                                <select class="form-control" name="sort" onchange='if(this.value !== name) { this.form.submit(); }'>
                                    <option value="">--Choose Type--</option>
                                    <option value="name">Title</option>
                                    <option value="date">Created Date</option>
                                    <option value="salaryA">Salary Ascending</option>
                                    <option value="salaryD">Salary Descending</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </form>
                
                <br>

                <div class="row">
                <%
                    for(RecruitmentDetail rd: list)
                    {   %>
                        <div class="col-sm-6">
                            <div class="card h-80">
                                <div class="card-body">
                                    <h4 class="card-title"><b><% out.print(rd.getTitle()); %></b></h4>

                                    <p class="card-text" style="font-size: 14px">
                                        <ul>
                                            <li>Position:
                                                <% 
                                                    for(PositionDetail pos: rd.getPosition())
                                                    { %>
                                                        <span class="badge badge-warning"><% out.print(pos.getName()); %> </span>
                                                        <ul>
                                                            Required: 
                                                                <% 
                                                                    for(Skill s: pos.getSkill())
                                                                    { %>
                                                                        <span class="badge badge-success"><% out.print(s.getName()); %> </span>
                                                                    <% }
                                                                %>
                                                        </ul>
                                                    <% }
                                                %>
                                            </li>
                                                            
                                            <li>Salary: <b><% out.print(rd.getSalary() == 0 ? "Negotiated Salary" : rd.getSalary() + " VND"); %></b></li>
                                        </ul>
                                    </p>
                                    
                                    <p class="card-text float-left" style="font-size: 14px">
                                        <i><u>Upload on: <fmt:formatDate value="<%=rd.getDate_create()%>" pattern="dd/MM/yyyy" /></u></i>
                                    </p>
                                    <a href="detail-recruit?id=<%= rd.getId() %>" class="btn btn-primary float-right"><i class="fa fa-info-circle"></i> Details</a>
                                </div>
                            </div>
                                <div style="height: 30px"></div>
                        </div>
                    <%  } 
                %>
                    
                </div>

                <br>
<!--                <a href="add-recruit" class="btn btn-success float-right"><strong>Add New Recruitment</strong></a>-->
                <div style="height:50px"></div>
                <br><br><br>
            </div>
                
            <% }  else { %>
            <div class="container">
                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-9">
                        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img class="d-block img-fluid" src="images/banner1.jpg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="images/banner2.jpg" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="images/banner3.jpg" alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="images/banner4.jpg" alt="Fourth slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <br>
                <div class="container">
                    <div class="container">
                        <div class="shadow p-4 mb-4 bg-white">
                            <div class="carecruit h-80">
                                <div class="carecruit-body">
                                    <h2 class="carecruit-title text-center"><b><% out.print(recruit.getTitle()); %></b></h2>
                                    <div class="container">
                                        <p class="carecruit-text" style="font-size: 14px">
                                            <ul>
                                                <li>Position:
                                                    <% 
                                                        for(PositionDetail pos: recruit.getPosition())
                                                        { %>
                                                            <span class="badge badge-warning"><% out.print(pos.getName()); %> </span>
                                                            <ul>
                                                                Required:  
                                                                    <% 
                                                                        for(Skill s: pos.getSkill())
                                                                        { %>
                                                                            <span class="badge badge-success"><% out.print(s.getName()); %> </span>
                                                                        <% }
                                                                    %>
                                                            </ul>
                                                        <% }
                                                    %>
                                                </li>
                                                <li>Quantity: <% out.print(recruit.getQuantity()); %></li>
                                                <li>Salary: <b><% out.print(recruit.getSalary() == 0 ? "Negotiated Salary" : recruit.getSalary() + " VND"); %></b></li>
                                            </ul>
                                            <% 
                                                String[] arr = recruit.getContent().split("\n");
                                                for(int i = 0; i < arr.length; i++)
                                                {
                                                    out.print(arr[i] + "<br>");
                                                    
                                                }
                                            %><br>
                                        </p>
                                    </div>
                                    
                                    <p class="carecruit-text float-left" style="font-size: 14px">
                                        <u>From: <fmt:formatDate value="<%=recruit.getDate_create()%>" pattern="dd/MM/yyyy" /></u>
                                        <br><u>To: <fmt:formatDate value="<%=recruit.getDate_end()%>" pattern="dd/MM/yyyy" /></u>
                                    </p>
                                    <br>
                                    <p class="carecruit-text float-left" style="font-size: 14px">
                                    </p>
                                    <a href="home" class="btn btn-primary float-right">Back</a>
                                    <br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                                                   
                </div>
            </div>
            <div style="height:50px"></div>
                <br><br><br>
            <% } %>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>    
</body>