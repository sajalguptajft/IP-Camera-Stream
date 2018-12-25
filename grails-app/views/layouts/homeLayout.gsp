<%--
  Created by IntelliJ IDEA.
  User: sajal
  Date: 25/12/18
  Time: 10:37 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="View Child Video"/></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title><g:layoutTitle default="View Child Video"/></title>
    <link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/css/bootstrap.css" type="text/css" media="all" />
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,600,600i,700" rel="stylesheet" />
    <script src="/js/jquery.js"></script>
    <script src="/js/jquery-ui.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
    <style type="text/css">
        label.error {
            color: red;
            margin-left: 5px;
        }
    </style>
    <g:layoutHead/>
</head>
<body>
<sec:ifLoggedIn>
    <g:link class="btn" controller="home" action="dashboard">Dashboard</g:link>
    <sec:ifAllGranted roles="ROLE_ADMIN">
        <g:link class="btn" controller="home" action="register">Register New User</g:link>
    </sec:ifAllGranted>
    <g:link class="btn" controller="logout">Logout</g:link>
</sec:ifLoggedIn>
<g:layoutBody/>
</body>
</html>