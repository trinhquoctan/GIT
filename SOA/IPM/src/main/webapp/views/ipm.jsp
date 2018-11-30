
<%@page import="com.fsoft.fa.ipm.model.PositionDetail"%>
<%@page import="com.fsoft.fa.ipm.model.Skill"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="com.fsoft.fa.ipm.model.RecruitmentDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<head>
    <title>File Management</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <style>
        button:focus {
            outline: 0;
        }

        .navbar .dropdown-menu .form-control {
            width: 300px;
        }
    </style>
</head>

<body style="background-color: #cccccc">
    <header class="py-4 bg-dark">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" role="navigation">
                <div class="container">

                    <a class="navbar-brand" href="#">Home</a>
                    <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        &#9776;
                    </button>
                    <div class="collapse navbar-collapse" id="exCollapsingNavbar">

                        <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
                            <li class="dropdown order-1">
                                <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle">Login <span class="caret"></span></button>
                                <ul class="dropdown-menu dropdown-menu-right mt-2">
                                    <li class="px-3 py-2">
                                        <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST" class="ajax-login-form">
                                            <div class="form-group">
                                                <div class="col-xs-15">
                                                    <div>
                                                        <!-- Check for login error -->
                                                        <c:if test="${param.error != null}">
                                                            <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                                                Invalid username and password.
                                                            </div>
                                                        </c:if>
                                                        <!-- Check for logout -->
                                                        <c:if test="${param.logout != null}">
                                                            <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                                                You have been logged out.
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label><span class="glyphicon glyphicon-user"></span>Username:</label>
                                                <input type="text" class="form-control " name="username" required>
                                            </div>
                                            <div class="form-group">
                                                <label><span class="glyphicon glyphicon-eye-open"></span>Password:</label>
                                                <input type="password" class="form-control" name="password" required>
                                            </div>
                                            <div class="check-box">
                                                <label for="remember"><input type="checkbox" tabindex="3" name="remember" id="remember"> Remember Me</label>
                                            </div>
                                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Login</button>  
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </form:form>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <%
        //request.getAttribute("list")
        List<RecruitmentDetail> list = null;
        RecruitmentDetail recruit = null;
        if (request.getAttribute("list") != null) {
            list = (ArrayList<RecruitmentDetail>) request.getAttribute("list");
        } else if (request.getAttribute("recruit") != null) {
            recruit = (RecruitmentDetail) request.getAttribute("recruit");
        }
    %>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 p-0" style="background-color: #ffffff">
                <div style="height: 20px"></div>

                <!--iframe id="list" src="category.jsp" width="100%" height="100%" frameborder="0"></iframe-->    

            </div>


            <div class="col-lg-9">
                <br>
                <% if (request.getAttribute("recruit") == null) { %>
                <div class="shadow-sm p-4 mb-4 bg-white">
                    <h2 class="text-danger text-center"><b>ANNOUNCEMENT</b></h2>
                </div>

                <div class="float-right">
                    <form class="form-inline" action="ipm-search-recruit" method="POST">
                        <input class="form-control mr-sm-2" name="key" type="text" placeholder="Enter key words">
                        <input class="btn btn-success" type="submit" value="Search">
                    </form>
                </div>

                <div class="container">
                    <form action="ipm" method="GET">
                        <div class="form-group row">
                            <label class="col-lg-2 col-form-label form-control-label">Sort by: </label>
                            <div class="col-lg-4">
                                <label class="custom-file">
                                    <select class="form-control" name="sort" onchange='if (this.value !== name) {
                                                this.form.submit();
                                            }'>
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
                            for (RecruitmentDetail rd : list) {   %>
                        <div class="col-sm-6">
                            <div class="card h-80">
                                <div class="card-body">
                                    <h4 class="card-title"><b><% out.print(rd.getTitle()); %></b></h4>

                                    <p class="card-text" style="font-size: 14px">
                                    <ul>
                                        <li>Position:
                                            <%
                                                for (PositionDetail pos : rd.getPosition()) { %>
                                            <span class="badge badge-warning"><% out.print(pos.getName()); %> </span>
                                            <ul>
                                                Required: 
                                                <%
                                                    for (Skill s : pos.getSkill()) { %>
                                                <span class="badge badge-success"><% out.print(s.getName()); %> </span>
                                                <% }
                                                %>
                                            </ul>
                                            <% }
                                            %>
                                        </li>

                                        <li>Salary: <b><% out.print(rd.getSalary() == 0 ? "Negotiated Salary" : rd.getSalary() + " VND");%></b></li>
                                    </ul>
                                    </p>

                                    <p class="card-text float-left" style="font-size: 14px">
                                        <i><u>Upload on: <fmt:formatDate value="<%=rd.getDate_create()%>" pattern="dd/MM/yyyy" /></u></i>
                                    </p>
                                    <a href="ipm-detail-recruit?id=<%= rd.getId()%>" class="btn btn-primary float-right"><i class="fa fa-info-circle"></i> Details</a>
                                </div>
                            </div>
                            <div style="height: 30px"></div>
                        </div>
                        <%  }
                        %>

                    </div>

                    <br>
                    <div style="height:50px"></div>
                    <br><br><br>
                </div>

                <% } else { %>
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
                                                        for (PositionDetail pos : recruit.getPosition()) { %>
                                                    <span class="badge badge-warning"><% out.print(pos.getName()); %> </span>
                                                    <ul>
                                                        Required:  
                                                        <%
                                                            for (Skill s : pos.getSkill()) { %>
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
                                                for (int i = 0; i < arr.length; i++) {
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
                <% }%>
            </div>
        </div>
    </div>

</body>