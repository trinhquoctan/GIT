

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <link href="resources/themes/lbd/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="resources/themes/lbd/assets/js/jquery-1.10.2.js" type="text/javascript"></script> -->
<!--<script src="resources/themes/lbd/assets/js/moment.js" type="text/javascript"></script>
<link href="resources/themes/lbd/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
<script src="resources/themes/lbd/assets/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>-->

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Skill</title>
        <style type="text/css">
            body {
                background-size: cover;
                font-family: monospace;
                background-color: #99FF66	
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
            .form-area{
                height: 200px;
                background-color: powderblue;
            }
        </style>
    </head>
    <body>
        <div class="container contact-form">

            <div class="row">
                <div class="col-md-6"></div>

                <div class="col-md-6">
                    <c:choose>
                        <c:when test="${not empty skill.name}">
                            <spring:url var="addSkillUrl" value="update-skill" />
                            <c:set var="title" value="Update skill" />
                            <c:set var="titleBtn" value="Update" />
                        </c:when>
                        <c:otherwise>
                            <spring:url var="addSkillUrl" value="create-skill" />
                            <c:set var="title" value="Create new skill" />
                            <c:set var="titleBtn" value="Create" />
                        </c:otherwise>
                    </c:choose>

                    <h1 style="margin-top: 10px">
                        <c:out value="${title}" />
                    </h1>
                    <hr>
                    <div class="col-md-8">
                        <form:form class="form-horizontal" method="POST"
                                   modelAttribute="skill" action="${addSkillUrl}">
                            <div class="form-group">
                                <label>SKill Name:</label>
                                <form:hidden path="id" />
                                <form:input path="name" type="text" class="form-control"
                                            id="name" placeholder="Nhập tên" />
                            </div>

                            <div class="row" style="margin-top: 10px">
                                <a href="skill-list" class="btn btn-primary pull-left">Back</a>
                                <input type="submit" class="btn btn-primary pull-right"
                                       value="<c:out value = "${titleBtn}"/>">
                            </div>

                        </form:form>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4"></div>
    </div>
</body>
</html>
