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
    <title>Проекты</title>

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
                        Проекты
                        <button id="create" type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#myModal">Создать
                        </button>
                        <button type="button" class="btn btn-primary"
                                onClick='location.href="<c:url value="/issueController/statistics"/>"'>
                            Статистика
                        </button>
                        <button type="button" class="btn btn-primary"
                                onClick='location.href="<c:url value="/projectController/search"/>"'>
                            Поиск
                        </button>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-fw fa-dashboard"></i> Проекты
                        </li>
                    </ol>
                </div>
            </div>

            <c:if test="${empty project.name}">
                <input id="mainObject" value=null style="display:none"/>
            </c:if>
            <c:if test="${!empty project.name}">
                <input id="mainObject" value=${project.name} style="display:none"/>
            </c:if>

            <h1>Список проектов</h1>

            <c:if test="${!empty listProjects}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th width="80">ID</th>
                            <th width="60">Название</th>
                            <th width="60">Описание</th>
                            <c:if test="${employeeSession.idRole == 1}">
                                <th width="60" colspan="2">Активности</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProjects}" var="project">
                            <tr>
                                <td>${project.idProject}</td>
                                <td><a href="/projectController/projectdata/${project.idProject}"
                                       target="_blank">${project.name}</a></td>
                                <td>${project.description}</td>
                                <c:if test="${employeeSession.idRole == 1}">
                                    <td>
                                        <button type="button" class="btn btn-primary" id="edit"
                                                style="margin-left: 0px;" onClick='location.href="<c:url
                                                value="/projectController/edit/${project.idProject}"/>"'>
                                            Редактировать
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" id="delete" class="btn btn-primary"
                                                onClick='location.href="<c:url
                                                        value="/projectController/remove/${project.idProject}"/>"'>
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

            <%--<c:if test="${employeeSession.idRole == 1}">
                <h1>Добавление проекта</h1>
                <c:url var="addAction" value="/projectController/projects/add"/>
                <form:form action="${addAction}" commandName="project">
                    <table>
                        <c:if test="${!empty project.name}">
                            <tr>
                                <td>
                                    <form:label path="idProject">
                                        <spring:message text="ID"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="idProject" readonly="true" size="8" disabled="true"/>
                                    <form:hidden path="idProject"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <form:label path="name">
                                    <spring:message text="name"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="name"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="description">
                                    <spring:message text="description"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="description"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <c:if test="${!empty project.name}">
                                    <input type="submit"
                                           value="<spring:message text="Редактировать"/>"/>
                                </c:if>
                                <c:if test="${empty project.name}">
                                    <input type="submit"
                                           value="<spring:message text="Добавить"/>"/>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </c:if>--%>

            <!-- Попап создания -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <c:if test="${empty project.name}">
                                <h4 class="modal-title" id="myModalLabel">Создание задачи</h4>
                            </c:if>
                            <c:if test="${!empty project.name}">
                                <h4 class="modal-title" id="myModalLabel">Редактирование задачи</h4>
                            </c:if>
                        </div>
                        <div class="modal-body">
                            <c:url var="addAction" value="/projectController/projects/add"/>
                            <form:form action="${addAction}" commandName="project" class="form-horizontal">
                                <div class="modal-body">
                                    <c:if test="${!empty project.name}">
                                        <form:input path="idProject" style="display:none"/>
                                    </c:if>
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
                                        <c:if test="${empty project.name}">
                                            <input type="submit" class="btn btn-primary" value="Создать"/>
                                        </c:if>
                                        <c:if test="${!empty project.name}">
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