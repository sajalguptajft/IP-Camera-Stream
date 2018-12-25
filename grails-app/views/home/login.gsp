<%--
  Created by IntelliJ IDEA.
  User: sajal
  Date: 18/12/18
  Time: 4:04 PM
--%>

<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="homeLayout">
    <title>Login</title>
    <sec:ifLoggedIn>
        <script>window.location.href="${createLink(controller: 'home', action: 'dashboard')}"</script>
    </sec:ifLoggedIn>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h4>Login</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <g:form uri="/j_spring_security_check" method="post" name="loginForm">
                <div class="form-group">
                    <label for="username">Username : </label>
                    <input class="form-control" type="text" id="username" name="j_username" placeholder="Enter Username" />
                </div>
                <div class="form-group">
                    <label for="password">Password : </label>
                    <input class="form-control" type="password" id="password" name="j_password" placeholder="Enter Password" />
                </div>
                <div class="form-group text-center">
                    <button class="btn btn-success" type="submit">Login</button>
                </div>
            </g:form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<script type="text/javascript">
    $("form[name='loginForm']").validate({
        rules : {
            j_username: "required",
            j_password: "required"
        },
        messages : {
            j_username: "Username is Required!",
            j_password: "Password is Required!"
        }
    });
</script>
</body>
</html>