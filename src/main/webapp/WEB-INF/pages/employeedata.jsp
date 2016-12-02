<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Информация о сотруднике</title>

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
                    <h1 class="page-header">Просмотр сотрудника</h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное
                            меню</a>
                        </li>
                        <li>
                            <i class="fa fa-user"></i> Сотрудники
                        </li>
                        <li class="active">
                            <i class="fa fa-desktop"></i> Просмотр сотрудника
                        </li>
                    </ol>
                </div>
            </div>


            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <div>
                    <div id="header">
                        <span>
                            <h3>${employee.idEmployee} - ${employee.firstName} ${employee.lastName}</h3>
                        </span>
                    </div>
                    <div id="details">
                        <span>
                            <h2 class="title">Общая информация</h2>
                        </span>
                        <table>
                            <tr>
                                <td id="attribute">Роль</td>
                                <td>
                                    <c:if test="${employee.idRole == 1}">
                                        Менеджер
                                    </c:if>
                                    <c:if test="${employee.idRole == 2}">
                                        QA Инженер
                                    </c:if>
                                </td>
                                <td id="attribute">Заработная плата</td>
                                <td>${employee.salary}</td>
                            </tr>
                            <tr>
                                <td id="attribute">Логин</td>
                                <td>${employee.login}</td>
                            </tr>
                            <tr>
                                <td id="attribute">Пароль</td>
                                <td>${employee.password}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <%--<h1>Подробная информация о сотруднике</h1>
            <table class="tg">
              <tr>
                <th width="80">ID</th>
                <th width="60">Роль</th>
                <th width="60">Фамилия</th>
                <th width="60">Имя</th>
              </tr>
              <tr>
                <td>${emloyee.idEmployee}</td>
                <td>${emloyee.idRole}</td>
                <td>${emloyee.firstName}</td>
                <td>${emloyee.lastName}</td>
              </tr>
            </table>--%>

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

</body>
</html>
