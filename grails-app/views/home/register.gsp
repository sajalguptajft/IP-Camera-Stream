<%--
  Created by IntelliJ IDEA.
  User: sajal
  Date: 18/12/18
  Time: 5:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="homeLayout">
    <title>Register New User</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h4>Register New User</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <g:form controller="home" action="register" method="POST" name="registerUser">
                <div class="form-group">
                    <label for="username">Username : </label>
                    <input class="form-control" type="text" id="username" name="username" placeholder="Enter Username" required />
                </div>
                <div class="form-group">
                    <label for="firstName">First Name : </label>
                    <input class="form-control" type="text" id="firstName" name="firstName" placeholder="Enter First Name" required />
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name : </label>
                    <input class="form-control" type="text" id="lastName" name="lastName" placeholder="Enter Last Name" required />
                </div>
                <div class="form-group">
                    <label for="password">Password : </label>
                    <input class="form-control" type="password" id="password" name="password" placeholder="Enter Password" required />
                </div>
                <div class="form-group">
                    <label for="streamURL">Stream URL : </label>
                    <input class="form-control" type="text" id="streamURL" name="streamURL" placeholder="Enter Stream URL" required />
                </div>
                <div class="form-group">
                    <label for="parentId">Select Senior : </label>
                    <select class="form-control" id="parentId" name="parentId" required>
                        <option value="">Choose Senior</option>
                        <g:each in="${userList}"><option value="${it.id}">${it.firstName} ${it.lastName}</option></g:each>
                    </select>
                </div>
                <div class="form-group text-center">
                    <button class="btn btn-success" type="submit">Register</button>
                    <g:link class="btn btn-danger" controller="home" action="dashboard">Cancel</g:link>
                </div>
            </g:form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<script type="text/javascript">
    $("form[name='registerUser']").validate({
        rules : {
            username: "required",
            firstName: "required",
            lastName: "required",
            password: "required",
            streamURL: "required",
            parentId: "required"
        },
        messages : {
            username: "Username is Required!",
            firstName: "First Name is Required!",
            lastName: "Last Name is Required!",
            password: "Password is Required!",
            streamURL: "Stream URL is Required!",
            parentId: "Senior is Required!"
        }
    });
</script>
</body>
</html>