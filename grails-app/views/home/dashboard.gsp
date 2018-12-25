<%--
  Created by IntelliJ IDEA.
  User: sajal
  Date: 18/12/18
  Time: 4:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="homeLayout">
    <title>Dashboard</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h4>List of Juniors :</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <g:if test="${children.isEmpty()}">
                <p class="text-center">No Juniors Found!</p>
            </g:if>
            <g:else>
                <div class="row">
                    <g:each in="${children}">
                        <div class="col-md-4">
                            ${it.firstName} ${it.lastName}
                        </div>
                        <div class="col-md-4">
                            <g:link controller="home" action="viewStream" params="[userId : it.id]" target="_blank">View Live Stream</g:link>
                        </div>
                        <div class="col-md-4">
                            <g:link controller="home" action="dashboard" params="[parentId : it.id]">View Juniors</g:link>
                        </div>
                    </g:each>
                </div>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>