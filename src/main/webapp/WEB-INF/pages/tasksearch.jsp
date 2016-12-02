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
    <title>Поиск задач</title>

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
                    <h1 class="page-header">Поиск задач</h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li>
                            <a href="<c:url value="/taskController/tasks"/>" target="_blank"><i
                                    class="fa fa-fw fa-edit"></i> Задачи </a>
                        </li>
                        <li class="active">
                            <i class="glyphicon glyphicon-search"></i> Поиск задач
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
                    <c:if test="${empty listTasks}">
                        К сожалению, по Вашему запросу ничего не найдено :(<br>
                    </c:if>
                    <c:if test="${!empty listTasks}">
                        Выберите фильтрацию или поиск данных
                    </c:if>
                </h1>
            </div>
            <div id="search" style="display:none">
                <c:url var="searchAction" value="/taskController/search"/>
                <form:form action="${searchAction}" commandName="task" class="form-horizontal">
                    <table>
                        <tr class="radio">
                            <td>
                                <form:label path="idTask" for="inputIdTask" class="col-sm-2 control-label"
                                            style="width: 109px;">
                                    <input type="radio" name="optionsRadios" value="" type="number"
                                           id="radioIdTask">ID задачи
                                </form:label>
                            </td>
                            <td>
                                <form:input path="idTask" class="form-control" placeholder="ID"
                                            id="inputIdTask"
                                            type="number" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="radio">
                            <td>
                                <form:label path="name" for="inputName" class="col-sm-2 control-label">
                                    <input type="radio" name="optionsRadios" value="" id="radioName">Название
                                </form:label>
                            </td>
                            <td>
                                <form:input path="name" class="form-control" placeholder="Название"
                                            id="inputName" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="radio">
                            <td>
                                <form:label path="description" for="inputDescription" class="col-sm-2 control-label">
                                    <input type="radio" name="optionsRadios" value="" id="radioDescription">Описание
                                </form:label>
                            </td>
                            <td>
                                <form:input path="description" class="form-control" placeholder="Описание"
                                            id="inputDescription" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" class="btn btn-primary" value="Поиск"/>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </div>
            <div id="filter" style="display:none">
                <form:form action="/taskController/filter" commandName="task" class="form-horizontal">
                    <table>
                        <tr class="checkbox">
                            <td>
                                <form:label path="idProject" for="selectProject" class="col-sm-2 control-label">
                                    <input type="checkbox" value="" id="checkboxProject">Проект
                                </form:label>
                            </td>
                            <td>
                                <form:select path="idProject" class="form-control" id="selectProject"
                                             disabled="true">
                                    <form:option value="0">Выберите проект</form:option>
                                    <c:forEach items="${listProjects}" var="project">
                                        <form:option value="${project.idProject}">${project.name}</form:option>
                                    </c:forEach>
                                </form:select>
                            </td>
                        </tr>
                        <tr class="checkbox">
                            <td>
                                <form:label path="name" for="inputNameFilter" class="col-sm-2 control-label">
                                    <input type="checkbox" value="" id="checkboxName">Название
                                </form:label>
                            </td>
                            <td>
                                <form:input path="name" class="form-control" placeholder="Название"
                                            id="inputNameFilter" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr class="checkbox">
                            <td>
                                <form:label path="description" for="inputDescriptionFilter"
                                            class="col-sm-2 control-label">
                                    <input type="checkbox" value="" id="checkboxDescription">Описание
                                </form:label>
                            </td>
                            <td>
                                <form:input path="description" class="form-control" placeholder="Описание"
                                            id="inputDescriptionFilter" type="text" disabled="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" class="btn btn-primary" value="Фильтр"/>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </div>
        </div>

        <c:if test="${!empty listTasks}">
            <div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th width="80">ID</th>
                            <th width="60">Проект</th>
                            <th width="60">Название</th>
                            <th width="60">Описание</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listTasks}" var="task">
                            <tr>
                                <td>${task.idTask}</td>
                                <td>
                                    <c:forEach items="${listProjects}" var="project">
                                        <c:if test="${project.idProject == task.idProject}">
                                            ${project.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><a href="/taskController/taskdata/${task.idTask}" target="_blank">${task.name}</a>
                                </td>
                                <td>${task.description}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </c:if>

    </div>
</div>


<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris-data.js"></script>
<script src="${pageContext.request.contextPath}/js/statisticTaskPage.js"></script>

</body>
</html>