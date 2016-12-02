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
    <title>Сотрудники</title>

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
                        Сотрудники
                        <button id="create" type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#myModal">Создать
                        </button>
                        <button type="button" class="btn btn-primary"
                                onClick='location.href="<c:url value="/employeeController/search"/>"'>
                            Статистика
                        </button>
                        <button type="button" class="btn btn-primary"
                                onClick='location.href="<c:url value="/employeeController/search"/>"'>
                            Поиск
                        </button>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-user"></i> Сотрудники
                        </li>
                    </ol>
                </div>
            </div>

            <c:if test="${empty employee.lastName}">
                <input id="mainObject" value=null style="display:none"/>
            </c:if>
            <c:if test="${!empty employee.lastName}">
                <input id="mainObject" value=${employee.lastName} style="display:none"/>
            </c:if>

            <div id="listEmployees"><h1>Список сотрудников</h1></div>

            <c:if test="${!empty listEmployees}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th width="80">ID</th>
                            <th width="60">Роль</th>
                            <th width="60">Фамилия</th>
                            <th width="60">Имя</th>
                            <c:if test="${employeeSession.idRole == 1}">
                                <th width="60" colspan="2">Активности</th>
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
                                <c:if test="${employeeSession.idRole == 1}">
                                    <td>
                                        <button type="button" class="btn btn-primary" id="edit"
                                                style="margin-left: 0px;" onClick='location.href="<c:url
                                                value="/employeeController/edit/${employee.idEmployee}"/>"'>
                                            Редактировать
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" id="delete" class="btn btn-primary"
                                                onClick='location.href="<c:url
                                                        value="/employeeController/remove/${employee.idEmployee}"/>"'>
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
                            <c:if test="${empty employee.lastName}">
                                <h4 class="modal-title" id="myModalLabel">Создание сотрудника</h4>
                            </c:if>
                            <c:if test="${!empty employee.lastName}">
                                <h4 class="modal-title" id="myModalLabel">Редактирование сотрудника</h4>
                            </c:if>
                        </div>
                        <div class="modal-body">
                            <c:url var="addAction" value="/employeeController/employees/add"/>
                            <form:form action="${addAction}" commandName="employee" class="form-horizontal">
                                <div class="modal-body">
                                    <c:if test="${!empty employee.lastName}">
                                        <form:input path="idEmployee" style="display:none"/>
                                    </c:if>
                                    <div class="form-group">
                                        <form:label path="idRole" for="selectIdRole"
                                                    class="col-sm-2 control-label">Роль</form:label>
                                        <div class="col-sm-10">
                                            <form:select path="idRole" class="form-control" id="selectIdRole">
                                                <form:option value="1">Менеджер</form:option>
                                                <form:option value="2">QA Инженер</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="firstName" for="inputFirstName"
                                                    class="col-sm-2 control-label">Имя</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="firstName" class="form-control" id="inputFirstName"
                                                        placeholder="Имя" required="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="lastName" for="inputLastName"
                                                    class="col-sm-2 control-label">Фамилия</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="lastName" class="form-control" id="inputLastName"
                                                        placeholder="Фамилия" required="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="login" for="inputLogin"
                                                    class="col-sm-2 control-label">Логин</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="login" class="form-control" id="inputLogin"
                                                        placeholder="Логин" required="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="password" for="inputPassword"
                                                    class="col-sm-2 control-label">Пароль</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="password" class="form-control" id="inputPassword"
                                                        placeholder="Пароль" required="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <form:label path="salary" for="inputSalary"
                                                    class="col-sm-2 control-label">Заработная плата</form:label>
                                        <div class="col-sm-10">
                                            <form:input path="salary" type="number" class="form-control"
                                                        id="inputSalary" required="1"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                                    <c:if test="${empty employee.lastName}">
                                        <input type="submit" class="btn btn-primary" value="Создать"/>
                                    </c:if>
                                    <c:if test="${!empty employee.lastName}">
                                        <input type="submit" class="btn btn-primary" value="Редактировать"/>
                                    </c:if>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%--<c:if test="${employeeSession.idRole == 1}">
          <h1>Добавление сотрудника</h1>
          <c:url var="addAction" value="/employeeController/employees/add"/>
          <form:form action="${addAction}" commandName="employee">
          <table>
            <c:if test="${!empty employee.firstName}">
              <tr>
                <td>
                  <form:label path="idEmployee">
                    <spring:message text="Идентификатор"/>
                  </form:label>
                </td>
                <td>
                  <form:input path="idEmployee" readonly="true" size="8" disabled="true"/>
                  <form:hidden path="idEmployee"/>
                </td>
              </tr>
            </c:if>
            <tr>
              <td>
                <form:label path="idRole">
                  <spring:message text="Роль"/>
                </form:label>
              </td>
              <td>
                <form:input path="idRole"/>
              </td>
            </tr>
            <tr>
              <td>
                <form:label path="firstName">
                  <spring:message text="Фамилия"/>
                </form:label>
              </td>
              <td>
                <form:input path="firstName"/>
              </td>
            </tr>
            <tr>
              <td>
                <form:label path="lastName">
                  <spring:message text="Имя"/>
                </form:label>
              </td>
              <td>
                <form:input path="lastName"/>
              </td>
            </tr>
            <tr>
              <td>
                <form:label path="login">
                  <spring:message text="Логин"/>
                </form:label>
              </td>
              <td>
                <form:input path="login"/>
              </td>
            </tr>
            <tr>
              <td>
                <form:label path="password">
                  <spring:message text="пароль"/>
                </form:label>
              </td>
              <td>
                <form:input path="password"/>
              </td>
            </tr>
            <tr>
              <td>
                <form:label path="salary">
                  <spring:message text="Заработная плата"/>
                </form:label>
              </td>
              <td>
                <form:input path="salary"/>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <c:if test="${!empty employee.firstName}">
                  <input type="submit"
                         value="<spring:message text="Редактировать"/>"/>
                </c:if>
                <c:if test="${empty employee.firstName}">
                  <input type="submit"
                         value="<spring:message text="Добавить"/>"/>
                </c:if>
              </td>
            </tr>
          </table>
        </form:form>
        </c:if>--%>

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