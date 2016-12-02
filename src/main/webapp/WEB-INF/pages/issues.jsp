<%@ page import="by.bsuir.bugTrackingSystem.model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Employee employeeSession =(Employee) session.getAttribute("employeeSession");%>

<html>
<head>
    <meta charset="utf-8">
    <title>Дефекты</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-info.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/component.css" />

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>

<head>
<body>
<div id="wrapper">
    <c:import url="template.jsp"></c:import>

    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Дефекты
                        <button id = "create" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Создать</button>
                        <button type="button" class="btn btn-primary" onClick='location.href="<c:url value="/issueController/statistics"/>"'>
                            Статистика
                        </button>
                        <button type="button" class="btn btn-primary" onClick='location.href="<c:url value="/issueController/search"/>"'>
                            Поиск
                        </button>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное меню</a>
                        </li>
                        <li class="active">
                            <i class="glyphicon glyphicon-th-list"></i> Дефекты
                        </li>
                    </ol>
                </div>
            </div>

            <c:if test="${empty issue.summary}">
                <input id="mainObject" value=null style="display:none"/>
            </c:if>
            <c:if test="${!empty issue.summary}">
                <input id="mainObject" value=${issue.summary} style="display:none"/>
            </c:if>

            <div id="listIssues"><h1>Список дефектов</h1></div>

            <%--<c:if test="${!empty listIssues}">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                            <th width="80">Предыдущий</th>
                            <th width="80">ID</th>
                            <th width="60">Дефект создан</th>
                            <th width="60">Проект</th>
                            <th width="60">Заголовок</th>
                            <th width="60">Тип вопроса</th>
                            <th width="60">Приоритет</th>
                            <th width="60">Статус</th>
                            <th width="60">Описание</th>
                            <th width="60">Дата создания</th>
                            <th width="60">Важность</th>
                            <th width="60">Тип ошибки</th>
                            <th width="60">Дефект назначен</th>
                            <th width="60">Редактировать</th>
                            <th width="60">Удалить</th>
                            <th width="80">Следующий</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listIssues}" var="issue">
                            <tr>
                                <td>
                                    Previous
                                </td>
                                <td>${issue.idIssue}</td>
                                <td>
                                    <c:forEach items="${listEmployees}" var="employee">
                                        <c:if test="${employee.idEmployee == issue.idEmployee}">
                                            ${employee.firstName} ${employee.lastName}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${listProjects}" var="project">
                                        <c:if test="${project.idProject == issue.idProject}">
                                            ${project.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><a href="/issueController/issuedata/${issue.idIssue}" target="_blank">${issue.summary}</a></td>
                                <td>${issue.issueType}</td>
                                <td>${issue.priority}</td>
                                <td>${issue.status}</td>
                                <td>${issue.description}</td>
                                <td>${issue.createdDate}</td>
                                <td>${issue.severity}</td>
                                <td>${issue.errorType}</td>
                                <td>${issue.assignee}</td>
                                <td>
                                    <a href="<c:url value='/issueController/edit/${issue.idIssue}'/>">Редактировать</a>
                                    &lt;%&ndash;<button type="button" class="btn btn-primary" data-toggle="modal" href="<c:url value='/issueController/edit/${issue.idIssue}'/>">Редактировать</button>&ndash;%&gt;
                                </td>
                                <td>
                                    <a href="<c:url value='/issueController/remove/${issue.idIssue}'/>">Удалить</a>
                                </td>
                                <td>
                                    Next
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            </c:if>--%>

            <c:if test="${!empty listIssues}">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox" style="padding-left: 40px;padding-right: 40px;">
                        <c:forEach items="${listIssues}" var="issue">
                            <c:if test="${issue.idIssue == 14}">
                                <div class="item active">
                            </c:if>
                            <c:if test="${issue.idIssue != 14}">
                                <div class="item">
                            </c:if>
                                    <div id="header">
                                        <div>
                                            <span><a href="/issueController/issuedata/${issue.idIssue}" target="_blank">${issue.idIssue}</a>
                                            </span>
                                                                /
                                            <span>
                                                <a href="/projectController/projectdata/${issue.idProject}" target="_blank">
                                                    <c:forEach items="${listProjects}" var="project">
                                                        <c:if test="${project.idProject == issue.idProject}">
                                                            ${project.name}
                                                        </c:if>
                                                    </c:forEach>
                                                </a>
                                            </span>
                                                                -
                                            <span>
                                                <h3>${issue.summary}</h3>
                                            </span>
                                        </div>
                                            <%--<div class="summary">
                                                <h3>${issue.summary}</h3>
                                            </div>--%>
                                    </div>
                                    <div id="activity">
                                        <span>
                                            <h2 class="title">Активности</h2>
                                        </span>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <button type="button" class="btn btn-primary" id="edit" onClick='location.href="<c:url value="/issueController/edit/${issue.idIssue}"/>"'>
                                                    Редактировать
                                                </button>
                                            </div>
                                            <c:if test="${employeeSession.idRole == 1}">
                                                <div class="col-lg-6">
                                                    <button type="button" id="delete" class="btn btn-primary" onClick='location.href="<c:url value="/issueController/remove/${issue.idIssue}"/>"'>
                                                        Удалить
                                                    </button>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div id="details">
                                        <span>
                                        <h2 class="title">Детали</h2>
                                        </span>
                                        <table>
                                            <tr>
                                                <td id="attribute">Тип вопроса</td>
                                                <td>${issue.issueType}</td>
                                                <td id="attribute">Статус</td>
                                                <td>${issue.status}</td>
                                            </tr>
                                            <tr>
                                                <td id="attribute">Приоритет</td>
                                                <td>${issue.priority}</td>
                                            </tr>
                                            <tr>
                                                <td id="attribute">Важность</td>
                                                <td>${issue.severity}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="people">
                                        <span>
                                            <h2 class="title">Сотрудники</h2>
                                        </span>
                                        <table>
                                            <tr>
                                                <td id="attribute">Над дефектом работают</td>
                                                <td>${issue.assignee}</td>
                                            </tr>
                                            <tr>
                                                <td id="attribute">Дефект создан</td>
                                                <td>
                                                    <c:forEach items="${listEmployees}" var="employee">
                                                        <c:if test="${employee.idEmployee == issue.idEmployee}">
                                                            ${employee.firstName} ${employee.lastName}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="dates">
                                        <span>
                                            <h2 class="title">Даты</h2>
                                        </span>
                                        <table>
                                            <tr>
                                                <td id="attribute">Дата создания</td>
                                                <td>${issue.createdDate}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="general">
                                        <span>
                                            <h2 class="title">Общее</h2>
                                        </span>
                                        <table>
                                            <tr>
                                                <td id="attribute">Описание</td>
                                                <td class="description">${issue.description}</td>
                                            </tr>
                                            <tr>
                                                <td id="attribute">Тип дефекта</td>
                                                <td>${issue.errorType}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                        </c:forEach>
                    </div>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="width: 40px">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="width: 40px">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </c:if>

            <%--<c:if test="${!empty listIssues}">
                <div id="slider">
                    <ul>
                    <c:forEach items="${listIssues}" var="issue">
                        <li>
                            &lt;%&ndash;<div>
                                <div id="header">
                                    <div>
                                        <span>
                                            <a href="/issueController/issuedata/${issue.idIssue}" target="_blank">${issue.idIssue}</a>
                                        </span>/
                                        <span>
                                            <a href="/projectController/projectdata/${issue.idProject}" target="_blank">
                                                <c:forEach items="${listProjects}" var="project">
                                                    <c:if test="${project.idProject == issue.idProject}">
                                                        ${project.name}
                                                    </c:if>
                                                </c:forEach>
                                            </a>
                                        </span>
                                    </div>
                                    <div class="summary">
                                        <h3>${issue.summary}</h3>
                                    </div>
                                </div>
                                <div id="activity">
                                    <span>
                                        <h2 class="title">Активности</h2>
                                    </span>
                                    <span>
                                        <a href="<c:url value='/issueController/edit/${issue.idIssue}'/>">Редактировать</a>
                                    </span>
                                </div>
                                <div id="details">
                                    <span>
                                    <h2 class="title">Детали</h2>
                                    </span>
                                    <table>
                                        <tr>
                                            <td id="attribute">Тип вопроса</td>
                                            <td>${issue.issueType}</td>
                                            <td id="attribute">Статус</td>
                                            <td>${issue.status}</td>
                                        </tr>
                                        <tr>
                                            <td id="attribute">Приоритет</td>
                                            <td>${issue.priority}</td>
                                        </tr>
                                        <tr>
                                            <td id="attribute">Важность</td>
                                            <td>${issue.severity}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="people">
                                    <span>
                                        <h2 class="title">Сотрудники</h2>
                                    </span>
                                    <table>
                                        <tr>
                                            <td id="attribute">Над дефектом работают</td>
                                            <td>${issue.assignee}</td>
                                        </tr>
                                        <tr>
                                            <td id="attribute">Дефект создан</td>
                                            <td>
                                                <c:forEach items="${listEmployees}" var="employee">
                                                    <c:if test="${employee.idEmployee == issue.idEmployee}">
                                                        ${employee.firstName} ${employee.lastName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="dates">
                                    <span>
                                        <h2 class="title">Даты</h2>
                                    </span>
                                    <table>
                                        <tr>
                                            <td id="attribute">Дата создания</td>
                                            <td>${issue.createdDate}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="general">
                                    <span>
                                        <h2 class="title">Общее</h2>
                                    </span>
                                    <table>
                                        <tr>
                                            <td id="attribute">Описание</td>
                                            <td>${issue.description}</td>
                                        </tr>
                                        <tr>
                                            <td id="attribute">Тип дефекта</td>
                                            <td>${issue.errorType}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>&ndash;%&gt;
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th width="80">ID</th>
                                            <th width="60">Дефект создан</th>
                                            <th width="60">Проект</th>
                                            <th width="60">Заголовок</th>
                                            <th width="60">Тип вопроса</th>
                                            <th width="60">Приоритет</th>
                                            <th width="60">Статус</th>
                                            <th width="60">Описание</th>
                                            <th width="60">Дата создания</th>
                                            <th width="60">Важность</th>
                                            <th width="60">Тип ошибки</th>
                                            <th width="60">Дефект назначен</th>
                                            <th width="60">Редактировать</th>
                                            <th width="60">Удалить</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${issue.idIssue}</td>
                                            <td>
                                                <c:forEach items="${listEmployees}" var="employee">
                                                    <c:if test="${employee.idEmployee == issue.idEmployee}">
                                                        ${employee.firstName} ${employee.lastName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach items="${listProjects}" var="project">
                                                    <c:if test="${project.idProject == issue.idProject}">
                                                        ${project.name}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><a href="/issueController/issuedata/${issue.idIssue}" target="_blank">${issue.summary}</a></td>
                                            <td>${issue.issueType}</td>
                                            <td>${issue.priority}</td>
                                            <td>${issue.status}</td>
                                            <td>${issue.description}</td>
                                            <td>${issue.createdDate}</td>
                                            <td>${issue.severity}</td>
                                            <td>${issue.errorType}</td>
                                            <td>${issue.assignee}</td>
                                            <td>
                                                <a href="<c:url value='/issueController/edit/${issue.idIssue}'/>">Редактировать</a>
                                                    &lt;%&ndash;<button type="button" class="btn btn-primary" data-toggle="modal" href="<c:url value='/issueController/edit/${issue.idIssue}'/>">Редактировать</button>&ndash;%&gt;
                                            </td>
                                            <td>
                                                <a href="<c:url value='/issueController/remove/${issue.idIssue}'/>">Удалить</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </c:if>--%>

            <!-- Попап создания -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <c:if test="${empty issue.summary}">
                                <h4 class="modal-title" id="myModalLabel">Создание дефекта</h4>
                            </c:if>
                            <c:if test="${!empty issue.summary}">
                                <h4 class="modal-title" id="myModalLabel">Редактирование дефекта</h4>
                            </c:if>
                        </div>
                        <div class="modal-body">
                            <c:url var="addAction" value="/issueController/issues/add"/>
                            <form:form action="${addAction}" commandName="issue" class="form-horizontal">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <form:label path="idProject" for="selectProject" class="col-sm-2 control-label">Проект</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="idProject" class="form-control" id="selectProject">
                                                <c:forEach items="${listProjects}" var="project">
                                                    <form:option value="${project.idProject}">${project.name}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="summary" for="inputSummary" class="col-sm-2 control-label">Заголовок</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="summary" class="form-control" id="inputSummary" placeholder="Заголовок" required="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="issueType" for="selectIssueType" class="col-sm-2 control-label">Тип дефекта</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="issueType" class="form-control" id="selectIssueType">
                                                <form:option value ="Defect">Дефект</form:option>
                                                <form:option value ="Story">Стори</form:option>
                                                <form:option value ="Task">Задача</form:option>
                                                <form:option value ="Improvement">Улучшение</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="priority" for="selectPriority" class="col-sm-2 control-label">Приоритет</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="priority" class="form-control" id="selectPriority">
                                                <form:option value ="Blocker">Blocker</form:option>
                                                <form:option value ="Critical">Critical</form:option>
                                                <form:option value ="Major">Major</form:option>
                                                <form:option value ="Minor">Minor</form:option>
                                                <form:option value ="Trivial">Trivial</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <c:if test="${!empty issue.summary}">
                                        <div class="form-group">
                                            <form:label path="status" for="selectStatus" class="col-sm-2 control-label">Статус</form:label>
                                            <div class="col-sm-10">
                                                <form:select path="status" class="form-control" id="selectStatus">
                                                    <form:option value ="Opened">Открыт</form:option>
                                                    <form:option value ="In progress">В прогрессе</form:option>
                                                    <form:option value ="Resolved">Исправлен Dev</form:option>
                                                    <form:option value ="Closed">Закрыт</form:option>
                                                    <form:option value ="TBR">Требует дополнения</form:option>
                                                    <form:option value ="Postponed">Отложен</form:option>
                                                    <form:option value ="Reopened">Переоткрыт</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <form:label path="description" for="areaDescription" class="col-sm-2 control-label">Описание</form:label>
                                        <div class="col-sm-10">
                                            <form:textarea path="description" required="1" class="form-control" rows="6" id="areaDescription" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="severity" for="selectSeverity" class="col-sm-2 control-label">Важность</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="severity" class="form-control" id="selectSeverity">
                                                <form:option value ="Critical">Critical</form:option>
                                                <form:option value ="Major">Major</form:option>
                                                <form:option value ="Average">Average</form:option>
                                                <form:option value ="Minor">Minor</form:option>
                                                <form:option value ="Enchancement">Enchancement</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="errorType" for="selectErrorType" class="col-sm-2 control-label">Тип ошибки</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="errorType" class="form-control" id="selectErrorType">
                                                <form:option value ="Functional">Функциональный дефект</form:option>
                                                <form:option value ="Requirement">Дефект по требованиям</form:option>
                                                <form:option value ="GUI">GUI дефект</form:option>
                                                <form:option value ="Performance">Дефект производительности</form:option>
                                                <form:option value ="Security">Дефект безопасности</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="assignee" for="selectAssignee" class="col-sm-2 control-label">Назначен на</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="assignee" class="form-control" id="selectAssignee">
                                                <form:option value ="Developer">Команда разработчиков</form:option>
                                                <form:option value ="QA">Команда тестировщиков</form:option>
                                                <form:option value ="Backlog">Бэклог</form:option>
                                                <form:option value ="Other">Другие</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div>
                                        <c:if test="${!empty issue.summary}">
                                            <form:input path="idIssue" style="display:none"/>
                                        </c:if>
                                        <form:input path="createdDate" readonly="true" disabled="true" style="display:none"/>
                                        <form:input path="idEmployee" value = "${employeeSession.idEmployee}" placeholder="${employeeSession.idEmployee}" style="display:none" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                                    <c:if test="${empty issue.summary}">
                                        <input type="submit" class="btn btn-primary" value="Создать"/>
                                    </c:if>
                                    <c:if test="${!empty issue.summary}">
                                        <input type="submit" class="btn btn-primary" value="Редактировать"/>
                                    </c:if>
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
<%--<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>--%>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris-data.js"></script>
<script src="${pageContext.request.contextPath}/js/loadPage.js"></script>

</body>
</html>