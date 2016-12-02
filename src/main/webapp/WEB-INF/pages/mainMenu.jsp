<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <meta charset="utf-8">
  <title>BTS</title>

  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-index.css" />

  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<head>

<body>
  <div id="wrapper">
    <c:import url="template.jsp"></c:import>

    <div id="page-wrapper">
      <div class="container-fluid">
        <h1>
          <br>О проекте</br>
        </h1>
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

</body>

</html>
