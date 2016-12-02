<%@ page import="by.bsuir.bugTrackingSystem.model.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Employee employeeSession =(Employee) session.getAttribute("employeeSession");%>


<div id="wrapper">
  <!-- Navigation -->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="/mainmenu" target="_blank">BUGSall</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${employeeSession.firstName} ${employeeSession.lastName} <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li>
            <a href="#"><i class="fa fa-fw fa-user"></i>Профиль</a>
          </li>
          <li>
            <a href="#"><i class="fa fa-fw fa-gear"></i>Настройки</a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="<c:url value="/logout"/>" target="_blank"><i class="fa fa-fw fa-power-off"></i>Выход</a>
          </li>
        </ul>
      </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav side-nav">
        <li class="active">
          <a href="<c:url value="/projectController/projects"/>" target="_blank"><i class="fa fa-fw fa-dashboard"></i>Проекты</a>
        </li>
        <li>
          <a href="<c:url value="/issueController/issues"/>" target="_blank"><i class="fa fa-fw fa-bar-chart-o"></i>Дефекты</a>
        </li>
        <li>
          <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-user"></i>Сотрудники<i class="fa fa-fw fa-caret-down"></i></a>
          <ul id="demo" class="collapse">
            <li>
              <a href="<c:url value="/employeeController/managers"/>" target="_blank">Менеджеры</a>
            </li>
            <li>
              <a href="<c:url value="/employeeController/enginers"/>" target="_blank">QA Инженеры</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="<c:url value="/taskController/tasks"/>" target="_blank"><i class="fa fa-fw fa-edit"></i>Задачи</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </nav>

</div>
<!-- /#wrapper -->