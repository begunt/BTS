<%@ page import="by.bsuir.bugTrackingSystem.model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%Employee employeeSession = (Employee) session.getAttribute("employeeSession");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>Поиск сотрудников</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-info.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-search.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/component.css"/>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <meta charset="UTF-8">

<head>
<body>
<div id="wrapper">
    <c:import url="template.jsp"></c:import>

    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Поиск сотрудников</h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li>
                            <i class="fa fa-user"></i> Сотрудники
                        </li>
                        <li class="active">
                            <i class="glyphicon glyphicon-search"></i> Поиск сотрудников
                        </li>
                    </ol>
                </div>
            </div>
            <section class="color-4">
                <div class="cl-effect-2">
                    <a id="linkFilter"><span data-hover="Фильтр">Фильтр</span></a>
                    <a id="linkSearch"><span data-hover="Поиск">Поиск</span></a>
                </div>
            </section>
            <div id="main">
                <h1>
                    <c:if test="${empty listEmployees}">
                        К сожалению, по Вашему запросу ничего не найдено :(<br>
                    </c:if>
                    <c:if test="${!empty listEmployees}">
                        Выберите фильтрацию или поиск данных
                    </c:if>
                </h1>
            </div>
            <div id="search" style="display:none">
                <c:url var="searchAction" value="/employeeController/search"/>
                <form:form action="${searchAction}" commandName="employee" class="form-horizontal">
                    <table>
                        <tr class="radio">
                            <td>
                                <form:label path="idEmployee" for="inputIdEmployee" class="col-sm-2 control-label"
                                            style="width: 109px;">
                                    <input type="radio" name="optionsRadios" value="" type="number"
                                           id="radioIdEmployee">ID сотрудника
                                </form:label>
                            </td>
                            <td>
                                <form:input path="idEmployee" class="form-control" placeholder="ID"
                                            id="inputIdEmployee"
                                            type="number" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="radio">
                            <td>
                                <form:label path="firstName" for="inputFirstName" class="col-sm-2 control-label">
                                    <input type="radio" name="optionsRadios" value="" id="radioFirstName">Фамилия
                                </form:label>
                            </td>
                            <td>
                                <form:input path="firstName" class="form-control" placeholder="Фамилия"
                                            id="inputFirstName" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="radio">
                            <td>
                                <form:label path="lastName" for="inputLastName" class="col-sm-2 control-label">
                                    <input type="radio" name="optionsRadios" value="" id="radioLastName">Имя
                                </form:label>
                            </td>
                            <td>
                                <form:input path="lastName" class="form-control" placeholder="Имя"
                                            id="inputLastName" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="radio">
                            <td>
                                <form:label path="login" for="inputLogin" class="col-sm-2 control-label">
                                    <input type="radio" name="optionsRadios" value="" id="radioLogin">Логин
                                </form:label>
                            </td>
                            <td>
                                <form:input path="login" class="form-control" placeholder="Логин"
                                            id="inputLogin" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <c:if test="${employeeSession.idRole == 1}">
                            <tr class="radio">
                                <td>
                                    <form:label path="salary" for="inputSalary" class="col-sm-2 control-label">
                                        <input type="radio" name="optionsRadios" value=""
                                               id="radioSalary">Заработная плата
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="salary" class="form-control" type="number" id="inputSalary"
                                                disabled="true"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <input type="submit" class="btn btn-primary" value="Поиск"/>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </div>
            <div id="filter" style="display:none">
                <form:form action="/employeeController/filter" commandName="employee" class="form-horizontal">
                    <table>
                        <tr class="checkbox">
                            <td>
                                <form:label path="firstName" for="inputFirstName" class="col-sm-2 control-label">
                                    <input type="checkbox" value="" id="checkboxFirstName">Фамилия
                                </form:label>
                            </td>
                            <td>
                                <form:input path="firstName" class="form-control" placeholder="Фамилия"
                                            id="inputFirstNameFilter" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="checkbox">
                            <td>
                                <form:label path="lastName" for="inputLastName" class="col-sm-2 control-label">
                                    <input type="checkbox" value="" id="checkboxLastName">Имя
                                </form:label>
                            </td>
                            <td>
                                <form:input path="lastName" class="form-control" placeholder="Имя"
                                            id="inputLastNameFilter" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <c:if test="${employeeSession.idRole == 1}">
                            <tr class="checkbox">
                                <td>
                                    <form:label path="salary" for="inputSalary" class="col-sm-2 control-label">
                                        <input type="checkbox" value="" id="checkboxSalary">Заработная плата
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="salary" class="form-control" type="number" id="inputSalaryFilter"
                                                disabled="true"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <input type="submit" class="btn btn-primary" value="Фильтр"/>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </div>
        </div>

        <c:if test="${!empty listEmployees}">
            <div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Роль</th>
                            <th>Фамилия</th>
                            <th>Имя</th>
                            <th>Логин</th>
                            <c:if test="${employeeSession.idRole == 1}">
                                <th>Заработная плата</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listEmployees}" var="employee">
                            <tr>
                                <td>${employee.idEmployee}</td>
                                <td>${employee.idRole}</td>
                                <c:if test="${employeeSession.idRole == 1}">
                                    <td><a href="/employeeController/employeedata/${employee.idEmployee}"
                                           target="_blank">${employee.firstName}</a></td>
                                </c:if>
                                <c:if test="${employeeSession.idRole == 2}">
                                    <td>${employee.firstName}</td>
                                </c:if>
                                <td>${employee.lastName}</td>
                                <td>${employee.login}</td>
                                <c:if test="${employeeSession.idRole == 1}">
                                    <td>${employee.salary}</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <%--<div id="filterTable" style="display: none">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th style="width: 40px;">ID</th>
                            <th>Проект</th>
                            <th>Заголовок</th>
                            <th>Статус</th>
                            <th>Дата создания</th>
                            <th>Описание</th>
                            <th>Приоритет</th>
                            <th>Важность</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listEmployees}" var="employee">
                            <tr>
                                <td style="width: 40px;">${employee.idEmployee}</td>
                                <td>
                                    <c:forEach items="${listProjects}" var="project">
                                        <c:if test="${project.idProject == employee.idProject}">
                                            ${project.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><a href="/employeeController/employeedata/${employee.idEmployee}"
                                       target="_blank">${employee.summary}</a></td>
                                <td>${employee.status}</td>
                                <td>${employee.createdDate}</td>
                                <td>${employee.description}</td>
                                <td>${employee.priority}</td>
                                <td>${employee.severity}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>--%>
        </c:if>

    </div>
</div>


<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris-data.js"></script>
<script src="${pageContext.request.contextPath}/js/statisticEmployeePage.js"></script>

</body>
</html>