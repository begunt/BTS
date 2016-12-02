<%@ page import="by.bsuir.bugTrackingSystem.model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Employee employeeSession = (Employee) session.getAttribute("employeeSession");%>

<html>
<head>
    <meta charset="utf-8">
    <title>Информация о дефекте</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-index.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-info.css"/>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<div id="wrapper">
    <c:import url="template.jsp"></c:import>

    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Просмотр дефекта</h1>
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
                            <i class="fa fa-desktop"></i> Просмотр дефекта
                        </li>
                    </ol>
                </div>
            </div>
            <div>
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
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
r
<%--<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>--%>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/morris/morris-data.js"></script>

</body>
</html>