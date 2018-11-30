<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    

                    <h1 style="margin-top: 10px">
                        Apply New
                    </h1>
                    <hr>
                    <div class="col-md-8">
                        <form:form method="POST" action="create-candidate" enctype="multipart/form-data">
                            <div class="form-group">
                                <b>Full Name: </b> 
            <form:input path="fullname"/>
            
            <br/>
			
            <b>Major: </b>
            <form:input path="major"/>
            
            <br/>
			
            <b>Birthday: </b>
            <form:input type="date" path="birthday"/>
            
            <br/>
			
            <b>Gender: </b>
            <form:select path="gender">
                <form:option value="Male">Male</form:option>
                <form:option value="Female">Female</form:option>
            </form:select>
            
            <br/>
			
            <b>Identity Card: </b>
            <form:input path="idCard"/>
            
            <br/>
			
            <b>Skill:</b><br/>
            <form:checkboxes items="${skillList}" path="skill" delimiter="<br>"/>
            
            <br/>
			
            <b>Email: </b>
            <form:input path="email"/>
            
            <br/>
			
            <b>Phone: </b>
            <form:input path="phone" type="number"/>
            <form:hidden path="cv" value="null"/>
            <form:hidden path="status" value="Pending"/>
            
			<br/>
			
            <label>Certificate Vitae</label>
            <input type="file" id="file" name="file">            
            <br/>
                            </div>

                            <div class="row" style="margin-top: 10px">
                                <a href="candidate-list" class="btn btn-primary pull-left">Back</a>
                                <input type="submit" class="btn btn-primary pull-right"
                                       value="submit"/>
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










