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
    <title>Поиск дефектов</title>

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
                    <h1 class="page-header">Поиск дефектов</h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li>
                            <a href="<c:url value="/issueController/issues"/>" target="_blank"><i
                                    class="glyphicon glyphicon-th-list"></i> Дефекты</a>
                        </li>
                        <li class="active">
                            <i class="glyphicon glyphicon-search"></i> Поиск дефектов
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
            <td>
                <div id="main">
                    <h1>
                        <c:if test="${empty listIssues}">
                            К сожалению, по Вашему запросу ничего не найдено :(<br>
                        </c:if>
                        <c:if test="${!empty listIssues}">
                            Выберите фильтрацию или поиск данных
                        </c:if>
                    </h1>
                </div>
                <div id="search" style="display:none">
                    <form:form action="${searchAction}" commandName="issue" class="form-horizontal">
                        <table>
                            <tr class="radio">
                                <td>
                                    <form:label path="summary" for="inputSummary" class="col-sm-2 control-label">
                                        <input type="radio" name="optionsRadios" value="" id="radioSummary">Заголовок
                                    </form:label>
                                </td>
                                <td>
                                        <form:input path="summary" class="form-control" placeholder="Заголовок"
                                                    id="inputSummary" type="text" disabled="true"/>
                                </td>
                            </tr>
                            <tr class="radio">
                                <td>
                                    <form:label path="description" for="areaDescription" class="col-sm-2 control-label">
                                        <input type="radio" name="optionsRadios" value="" id="radioDescription">Описание
                                    </form:label>
                                </td>
                                <td>
                                    <form:textarea path="description" class="form-control" placeholder="Описание"
                                                   id="areaDescription" disabled="true"/>
                                </td>
                            </tr>
                            <tr class="radio">
                                <td>
                                    <form:label path="idIssue" for="inputIdIssue" class="col-sm-2 control-label"
                                                style="width: 109px;">
                                        <input type="radio" name="optionsRadios" value="" id="radioIdIssue">ID дефекта
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="idIssue" class="form-control" placeholder="ID" id="inputIdIssue"
                                                type="number" disabled="true"/>
                                </td>
                            </tr>
                            <tr class="radio">
                                <td>
                                    <form:label path="createdDate" for="inputDate" class="col-sm-2 control-label"
                                                style="width: 131px;">
                                        <input type="radio" name="optionsRadios" value="" id="radioDate">Дата создания
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="createdDate" class="form-control" id="inputDate" type="date"
                                                disabled="true"/>
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
                    <form:form action="/issueController/filter" commandName="issue" class="form-horizontal">
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
                                    <form:label path="idEmployee" for="selectEmployee" class="col-sm-2 control-label"
                                                style="width: 133px;">
                                        <input type="checkbox" value="" id="checkboxEmployee">Дефект создан
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="idEmployee" class="form-control" id="selectEmployee"
                                                 disabled="true">
                                        <form:option value="0">Выберите создателя дефекта</form:option>
                                        <c:forEach items="${listEmployees}" var="employee">
                                            <form:option
                                                    value="${employee.idEmployee}">${employee.firstName} ${employee.lastName}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </td>
                            </tr>
                            <tr class="checkbox">
                                <td>
                                    <form:label path="issueType" for="selectIssueType" class="col-sm-2 control-label"
                                                style="width: 120px;">
                                        <input type="checkbox" value="" id="checkboxIssueType">Тип вопроса
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="issueType" class="form-control" id="selectIssueType"
                                                 disabled="true">
                                        <form:option value="0">Выберите тип вопроса</form:option>
                                        <form:option value="Defect">Дефект</form:option>
                                        <form:option value="Story">Стори</form:option>
                                        <form:option value="Task">Задача</form:option>
                                        <form:option value="Improvement">Улучшение</form:option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr class="checkbox">
                                <td>
                                    <form:label path="priority" for="selectPriority" class="col-sm-2 control-label">
                                        <input type="checkbox" value="" id="checkboxPriority">Приоритет
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="priority" class="form-control" id="selectPriority"
                                                 disabled="true">
                                        <form:option value="0">Выберите приоритет</form:option>
                                        <form:option value="Blocker">Blocker</form:option>
                                        <form:option value="Critical">Critical</form:option>
                                        <form:option value="Major">Major</form:option>
                                        <form:option value="Minor">Minor</form:option>
                                        <form:option value="Trivial">Trivial</form:option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr class="checkbox">
                                <td>
                                    <form:label path="status" for="selectStatus" class="col-sm-2 control-label">
                                        <input type="checkbox" value="" id="checkboxStatus">Статус
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="status" class="form-control" id="selectStatus" disabled="true">
                                        <form:option value="0">Выберите статус</form:option>
                                        <form:option value="Opened">Открыт</form:option>
                                        <form:option value="In progress">В прогрессе</form:option>
                                        <form:option value="Resolved">Исправлен Dev</form:option>
                                        <form:option value="Closed">Закрыт</form:option>
                                        <form:option value="TBR">Требует дополнения</form:option>
                                        <form:option value="Postponed">Отложен</form:option>
                                        <form:option value="Reopened">Переоткрыт</form:option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr class="checkbox">
                                <td>
                                    <form:label path="severity" for="selectSeverity" class="col-sm-2 control-label">
                                        <input type="checkbox" value="" id="checkboxSeverity">Важность
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="severity" class="form-control" id="selectSeverity"
                                                 disabled="true">
                                        <form:option value="0">Выберите важность</form:option>
                                        <form:option value="Critical">Critical</form:option>
                                        <form:option value="Major">Major</form:option>
                                        <form:option value="Average">Average</form:option>
                                        <form:option value="Minor">Minor</form:option>
                                        <form:option value="Enchancement">Enchancement</form:option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr class="checkbox">
                                <td>
                                    <form:label path="errorType" for="selectErrorType" class="col-sm-2 control-label"
                                                style="width: 113px;">
                                        <input type="checkbox" value="" id="checkboxErrorType"> Тип дефекта
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="errorType" class="form-control" id="selectErrorType"
                                                 disabled="true">
                                        <form:option value="0">Выберите тип дефекта</form:option>
                                        <form:option value="Functional">Функциональный дефект</form:option>
                                        <form:option value="Requirement">Дефект по требованиям</form:option>
                                        <form:option value="GUI">GUI дефект</form:option>
                                        <form:option value="Performance">Дефект производительности</form:option>
                                        <form:option value="Security">Дефект безопасности</form:option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr class="checkbox">
                                <td>
                                    <form:label path="assignee" for="selectAssignee" class="col-sm-2 control-label"
                                                style="width: 118px;">
                                        <input type="checkbox" value="" id="checkboxAssignee">Назначен на
                                    </form:label>
                                </td>
                                <td>
                                    <form:select path="assignee" class="form-control" id="selectAssignee"
                                                 disabled="true">
                                        <form:option value="0">Выберите, на кого назначен дефект</form:option>
                                        <form:option value="Developer">Команда разработчиков</form:option>
                                        <form:option value="QA">Команда тестировщиков</form:option>
                                        <form:option value="Backlog">Бэклог</form:option>
                                        <form:option value="Other">Другие</form:option>
                                    </form:select>
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

        <c:if test="${!empty listIssues}">
            <div id="searchTable">
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
                        <c:forEach items="${listIssues}" var="issue">
                            <tr>
                                <td style="width: 40px;">${issue.idIssue}</td>
                                <td>
                                    <c:forEach items="${listProjects}" var="project">
                                        <c:if test="${project.idProject == issue.idProject}">
                                            ${project.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><a href="/issueController/issuedata/${issue.idIssue}"
                                       target="_blank">${issue.summary}</a></td>
                                <td>${issue.status}</td>
                                <td>${issue.createdDate}</td>
                                <td>${issue.description}</td>
                                <td>${issue.priority}</td>
                                <td>${issue.severity}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="filterTable" style="display: none">
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
                        <c:forEach items="${listIssues}" var="issue">
                            <tr>
                                <td style="width: 40px;">${issue.idIssue}</td>
                                <td>
                                    <c:forEach items="${listProjects}" var="project">
                                        <c:if test="${project.idProject == issue.idProject}">
                                            ${project.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><a href="/issueController/issuedata/${issue.idIssue}"
                                       target="_blank">${issue.summary}</a></td>
                                <td>${issue.status}</td>
                                <td>${issue.createdDate}</td>
                                <td>${issue.description}</td>
                                <td>${issue.priority}</td>
                                <td>${issue.severity}</td>
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
<script src="${pageContext.request.contextPath}/js/statisticPage.js"></script>

</body>
</html>