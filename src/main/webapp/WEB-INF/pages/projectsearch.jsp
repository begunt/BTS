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
    <title>Поиск проектов</title>

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
                    <h1 class="page-header">Поиск проектов</h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li>
                            <a href="<c:url value="/projectController/projects"/>" target="_blank"><i
                                    class="fa fa-fw fa-dashboard"></i> Проекты </a>
                        </li>
                        <li class="active">
                            <i class="glyphicon glyphicon-search"></i> Поиск проектов
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
                    <c:if test="${empty listProjects}">
                        К сожалению, по Вашему запросу ничего не найдено :(<br>
                    </c:if>
                    <c:if test="${!empty listProjects}">
                        Выберите фильтрацию или поиск данных
                    </c:if>
                </h1>
            </div>
            <div id="search" style="display:none">
                <c:url var="searchAction" value="/projectController/search"/>
                <form:form action="${searchAction}" commandName="project" class="form-horizontal">
                    <table>
                        <tr class="radio">
                            <td>
                                <form:label path="idProject" for="inputIdProject" class="col-sm-2 control-label"
                                            style="width: 109px;">
                                    <input type="radio" name="optionsRadios" value="" type="number"
                                           id="radioIdProject">ID проекта
                                </form:label>
                            </td>
                            <td>
                                <form:input path="idProject" class="form-control" placeholder="ID"
                                            id="inputIdProject"
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
                <form:form action="/projectController/filter" commandName="project" class="form-horizontal">
                    <table>
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
                                <form:label path="description" for="inputDescriptionFilter" class="col-sm-2 control-label">
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

        <c:if test="${!empty listProjects}">
            <div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th width="80">ID</th>
                            <th width="60">Название</th>
                            <th width="60">Описание</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProjects}" var="project">
                            <tr>
                                <td>${project.idProject}</td>
                                <td>${project.name}</td>
                                <td>${project.description}</td>
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
<script src="${pageContext.request.contextPath}/js/statisticProjectPage.js"></script>

</body>
</html>