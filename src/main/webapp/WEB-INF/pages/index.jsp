<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Вход</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-index.css" />
<head>
<body>
<div>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="/" target="_blank">BUGSall</a>
        </div>
    </nav>

    <div class="loginBlock">
        <div class="container-fluid">
            <h1>Вход в баг-трекинговую систему</h1>
            <c:url var="addAction" value="/login"/>
            <form:form action="${addAction}" commandName="employee">

                <c:if test="${success}">
                    <div class="form-group">
                        <label>Логин</label>
                        <form:input path="login" class="form-control" placeholder="Введите логин"/>
                        <label>Пароль</label>
                        <form:input type="password" path="password" class="form-control" placeholder="Введите пароль"/>
                    </div>
                </c:if>

                <c:if test="${!success}">
                    <div class="form-group has-error">
                        <label class="control-label" for="inputError">Логин</label>
                        <form:input path="login" class="form-control" id="inputError" placeholder="Введите логин"/>
                        <label class="control-label" for="inputError">Пароль</label>
                        <form:input type="password" path="password" class="form-control" id="inputError" placeholder="Введите пароль"/>

                    </div>
                </c:if>
                <div>
                    <button type="submit" class="btn btn-default">Вход</button>
                </div>

            </form:form>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris-data.js"></script>
</body>

</html>
