<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
    <header class="py-4 bg-dark" style="height: 80px">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <div class="container">
                    <a class="navbar-brand" href="home" onclick=""><h2>Interview System</h2></a>
                    <div class="navbar-nav ml-auto">
                        <div class="btn-group dropup">
                               <!-- User: security:authentication property="principal.username"/>
                                Role(s): security:authentication property="principal.authorities"/ -->
                            <div class="btn-group">
                                <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                    <a href="edit-user?username=<security:authentication property="principal.username"/>"><button type="button" class="btn btn-secondary" ><security:authentication property="principal.username"/></button></a>
                                    <button type="submit" class="btn btn-secondary" data-toggle="tooltip" data-placement="right" title="Log Out">
                                        <i class="fa fa-sign-out" style="font-size:24px"></i>
                                    </button>
                                </form:form>
                            </div>


                        </div>
                            


                    </div>
                </div>
            </nav>  
        </div>
    </header>
</body>
