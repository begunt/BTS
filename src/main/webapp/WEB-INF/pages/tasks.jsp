<%@ page import="by.bsuir.bugTrackingSystem.model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Employee employeeSession = (Employee) session.getAttribute("employeeSession");%>

<html>
<head>
    <meta charset="utf-8">
    <title>Задачи</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-index.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-info.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/component.css"/>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<head>
<body>
<div id="wrapper">
    <c:import url="template.jsp"></c:import>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Задачи
                        <button id="create" type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#myModal">Создать
                        </button>
                        <button type="button" class="btn btn-primary"
                                onClick='location.href="<c:url value="/taskController/search"/>"'>
                            Поиск
                        </button>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-fw fa-edit"></i> Задачи
                        </li>
                    </ol>
                </div>
            </div>

            <c:if test="${empty task.name}">
                <input id="mainObject" value=null style="display:none"/>
            </c:if>
            <c:if test="${!empty task.name}">
                <input id="mainObject" value=${task.name} style="display:none"/>
            </c:if>

            <div id="listTasks"><h1>Список задач</h1></div>

            <c:if test="${!empty listTasks}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th width="80">ID</th>
                            <th width="60">Проект</th>
                            <th width="60">Название</th>
                            <th width="60">Описание</th>
                            <c:if test="${employeeSession.idRole == 1}">
                                <th width="60" colspan="2">Активности</th>
                            </c:if>
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
                                <c:if test="${employeeSession.idRole == 1}">
                                    <td>
                                        <button type="button" class="btn btn-primary" id="edit"
                                                style="margin-left: 0px;" onClick='location.href="<c:url
                                                value="/taskController/edit/${task.idTask}"/>"'>
                                            Редактировать
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" id="delete" class="btn btn-primary"
                                                onClick='location.href="<c:url
                                                        value="/taskController/remove/${task.idTask}"/>"'>
                                            Удалить
                                        </button>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <!-- Попап создания -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <c:if test="${empty task.name}">
                                <h4 class="modal-title" id="myModalLabel">Создание задачи</h4>
                            </c:if>
                            <c:if test="${!empty task.name}">
                                <h4 class="modal-title" id="myModalLabel">Редактирование задачи</h4>
                            </c:if>
                        </div>
                        <div class="modal-body">
                            <c:url var="addAction" value="/taskController/tasks/add"/>
                            <form:form action="${addAction}" commandName="task" class="form-horizontal">
                                <div class="modal-body">
                                    <c:if test="${!empty task.name}">
                                        <form:input path="idTask" style="display:none"/>
                                    </c:if>
                                    <div class="form-group">
                                        <form:label path="idProject" for="selectIdProject"
                                                    class="col-sm-2 control-label">Проект</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="idProject" class="form-control" id="selectIdRole">
                                                <c:forEach items="${listProjects}" var="project">
                                                    <form:option
                                                            value="${project.idProject}">${project.name}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="name" for="inputName"
                                                    class="col-sm-2 control-label">Название</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="name" class="form-control" id="inputName"
                                                        placeholder="Название" required="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="description" for="areaDescription"
                                                    class="col-sm-2 control-label">Описание</form:label>
                                        <div class="col-sm-10">
                                            <form:textarea path="description" required="1" class="form-control" rows="6"
                                                           id="areaDescription"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть
                                        </button>
                                        <c:if test="${empty task.name}">
                                            <input type="submit" class="btn btn-primary" value="Создать"/>
                                        </c:if>
                                        <c:if test="${!empty task.name}">
                                            <input type="submit" class="btn btn-primary" value="Редактировать"/>
                                        </c:if>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
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
<script src="${pageContext.request.contextPath}/js/loadPage.js"></script>


</body>
</html>