<%@page import="com.fsoft.fa.ipm.model.Skill"%>
<%@page import="com.fsoft.fa.ipm.model.PositionDetail"%>
<%@page import="com.fsoft.fa.ipm.model.Position"%>
<%@page import="com.fsoft.fa.ipm.model.RecruitmentDetail" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page language="java" %>
<%@page import="java.io.*, java.util.*, java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




</head>


<body>

    <!-- Modal -->
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
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
            </div>
        </div>
    </div> 




</body>


