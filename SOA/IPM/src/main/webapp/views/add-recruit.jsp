
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.fsoft.fa.ipm.model.Skill"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page import="com.fsoft.fa.ipm.model.RecruitmentDetail"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <style type="text/css">
        body {
            background-size: cover;
            font-family: monospace;
            background-color: #99FF66;
        }
        hr {
            background: white;
        }
        .contact-form {
            background: rgba(0, 0, 0, .6);
            color: white;
            margin-top: 100px;
            padding: 20px;
            box-shadow: 0px 0px 10px 3px grey;
        }
    </style>
</head>
<body>
<% 
    List<Skill> listSkill = null;
    List<Position> listPosition = null;
    if(request.getAttribute("skill") != null && request.getAttribute("position") != null)
    {
        listSkill = (List<Skill>) request.getAttribute("skill");
        listPosition = (List<Position>) request.getAttribute("position");
    }

%>
<jsp:include page="header.jsp"/>
    <div class="container contact-form">
        <div class="row">
            <div class="col-md-4"></div>
            
            <div class="col-md-8">
                <h1 style="margin-top: 10px">Add New Recruitment</h1>
                <hr>
            </div>
        </div>
        <div class="container">
                <div class="row m-y-2">
                    <div class="col-lg-12" style="display: none">
                        <div class="alert alert-info alert-dismissable"> <a class="panel-close close" data-dismiss="alert">×</a>
                            This is an <strong>.alert</strong>. Use this to show important messages to the user.
                        </div>
                    </div>
                    <div class="col-lg-8 push-lg-4 personal-info">
                        <form:form role="form" class="form-horizontal" method="POST" modelAttribute="RecruitmentDetail" action="add-new-recruitment">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Title</label>
                                <div class="col-lg-9">
                                    <form:hidden path="id"/>
                                    <form:input class="form-control" path="title" type="text" id="title"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Content</label>
                                <div class="col-lg-9">
                                     <form:textarea class="form-control" rows="5" path="content" type="text" id="content"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Quantity</label>
                                <div class="col-lg-9">
                                    <form:input class="form-control" path="quantity" type="number" id="quantity"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Salary</label>
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <form:input class="form-control" type="number" path="salary" id="salary"/>
                                        </div>
                                        <div class="col-lg-3"> <b style="font-size: 20px">VND</b></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Create Date</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="date" value="" name="creat_date"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">End Date</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="date" value="" name="end_date"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Position</label>
                                <div class="col-lg-9">
                                    <select class="form-control" name="position_chosse">
                                        <option value="">--Choose Major--</option>
                                        <% 
                                        for(Position pos: listPosition)
                                        { %>
                                            <option value="<%= pos.getName() %>"><%= pos.getName() %></option>
                                        <% }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Skill</label>
                                <div class="col-lg-9">
                                    <% 
                                    for(int i = 0; i < listSkill.size(); i++)
                                    { %>
                                    <div class="form-check-inline">
                                        <label class="form-check-label" for="radio">
                                            <input type="checkbox" class="form-check-input" id="<%= listSkill.get(i).getName() %>" value="<%= listSkill.get(i).getName() %>"><%= listSkill.get(i).getName() %>
                                        </label>
                                    </div>
                                    <% if(i%4 == 3) out.print("<br>");}
                                    %>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label"></label>
                                <div class="col-lg-9">
                                    <a href="home" class="btn btn-secondary">Cancel</a>
                                    <input type="submit" class="btn btn-primary" value="Add" />
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
                
            </div>    
    </div>

    
    <div style="height: 20px"></div>
<jsp:include page="footer.jsp"/>
</body>
</html>
