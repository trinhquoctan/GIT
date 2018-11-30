

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
        <title>User add</title>
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

                    <h1 style="margin-top: 10px">
                        Add User
                    </h1>
                    <hr>
                    <div class="col-md-8">
                        <form:form class="form-horizontal" method="POST"
                                   modelAttribute="user" action="create-user">
                            <div class="form-group">
                                <label><b>Username: </b></label>
                                <form:input path="username" type="text"	placeholder="abc@gmail.com or def@yahoo." />
                            </div>

                            <div class="form-group">
                                <label><b>Password: </b></label>
                                <form:input path="password" type="password"/>
                            </div>

                            <div class="form-group">
                                <label><b>Role: </b></label>
                                <form:select path="role" cssStyle="height: 35px">
                                    <form:option value="admin">Adminnitration</form:option>
                                    <form:option value="HR">Human Resource Management</form:option>
                                    <form:option value="interviewer">Interviewer</form:option>
                                </form:select>
                            </div>

                            <div class="form-group">
                                <label><b>Fullname: </b></label>
                                <form:input path="fullname" type="text"	placeholder="Nguyen Van A" />
                            </div>

                            <div class="form-group">
                                <label><b>Phone: </b></label>
                                <form:input path="phone" type="number" placeholder="0123456789(0)" />
                            </div>

                            <div class="form-group">
                                <label><b>Email: </b></label>
                                <form:input path="email" type="text" placeholder="abc@gmail.com" />
                            </div>

                            <form:hidden path="enabled" value="1"/>

                            <div class="row" style="margin-top: 10px">
                                <a href="list_skill" class="btn btn-primary pull-left">Back</a>
                                <input type="submit" class="btn btn-primary pull-right" value="Add">
                            </div>

                        </form:form>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4"></div>
</body>
</html>
