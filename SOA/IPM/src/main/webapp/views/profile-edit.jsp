<%-- 
    Document   : profile-edit
    Created on : Aug 17, 2018, 11:34:02 PM
    Author     : ThieuIT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
        <style>

        </style>
    </head>
    <body>
        <hr>
        <div class="container bootstrap snippet">
            <div class="row">
                <div class="col-sm-10"></div>
                <div class="col-sm-2"><a href="home" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="https://mms.businesswire.com/media/20171215005239/en/630231/5/FPT-Software-Ngang-2017-1024x400.jpg"></a></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><!--left col-->


                    <div class="text-center">
                        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                        <h2><security:authentication property="principal.username"/></h2>
                        <h6>Upload a different photo...</h6>
                        <input type="file" class="text-center center-block file-upload">
                    </div></hr><br>

                </div><!--/col-3-->
                <div class="col-sm-9">
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <hr>
                            <c:choose>
                                <c:when test="${not empty user.username}">
                                    <spring:url var="editProfile" value="update-profile"/>    
                                    <c:set var="title" value ="Eidt Profile"/>
                                </c:when>
                            </c:choose>
                            <h3><c:out value="${user.username}"/></h3>
                            <form:form class="form" action="${editProfile}" method="post" id="registrationForm" modelAttribute="user">
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="name"><h4>Name:</h4></label>
                                        <form:hidden path="username"/>
                                        <form:input path="fullname" type="text" class="form-control" id="name" placeholder="enter name"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone"><h4>Phone:</h4></label>
                                        <form:input path="phone" type="text" class="form-control" id="phone" placeholder="enter phone"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="email"><h4>Email:</h4></label>
                                        <form:input path="email" type="email" class="form-control" id="email" placeholder="you@email.com"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="Password"><h4>Password: </h4></label>
                                        <form:input path="password" type="text" class="form-control" id="password" placeholder="Password"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <br>
                                        <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                        <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                    </div>
                                </div>
                            </form:form>

                            <hr>

                        </div><!--/tab-pane-->


                    </div><!--/tab-content-->

                    <hr>

                </div><!--/tab-pane-->


            </div><!--/col-9-->
        </div><!--/row-->
    </body>
    <script>
        $(document).ready(function () {


            var readURL = function (input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.avatar').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }


            $(".file-upload").on('change', function () {
                readURL(this);
            });
        });
    </script>
</html>
