<%@ page import="by.bsuir.bugTrackingSystem.model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%Employee employeeSession =(Employee) session.getAttribute("employeeSession");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>Статистика дефектов</title>

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

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <meta charset="UTF-8">

    <!-- Загрузка AJAX API -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

        google.load('visualization', '1.0', {'packages': ['corechart'] });
        google.setOnLoadCallback(drawChartByIssueType);
        google.setOnLoadCallback(drawChartByErrorType);
        google.setOnLoadCallback(drawLineChartByTime);
        google.setOnLoadCallback(drawChartByStatus);
        google.setOnLoadCallback(drawChartByAssignee);

        function drawChartByIssueType() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Тип вопроса');
            data.addColumn('number', 'Количество');
            data.addRows([
                [ 'Дефекты', ${statisticByType.get("Defect")} ],
                [ 'Стори', ${statisticByType.get("Story")} ],
                [ 'Задачи', ${statisticByType.get("Task")} ],
                [ 'Улучшения', ${statisticByType.get("Improvement")} ]
            ]);

            var options = {
                'title': 'Статистика по типу вопроса',
                'width': 1000,
                'height': 550,
                'is3D': true
            };

            var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));
            chart.draw(data, options);
        }
        function drawChartByErrorType() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Тип дефекта');
            data.addColumn('number', 'Количество');
            data.addRows([
                [ 'Функциональный дефект', ${statisticByErrorType.get("Functional")} ],
                [ 'Дефект по требованиям', ${statisticByErrorType.get("Requirement")} ],
                [ 'GUI дефект', ${statisticByErrorType.get("GUI")} ],
                [ 'Дефект производительности', ${statisticByErrorType.get("Performance")} ],
                [ 'Дефект безопасности', ${statisticByErrorType.get("Security")} ]
            ]);

            var options = {
                'title': 'Статистика по типу дефекта',
                'width': 1000,
                'height': 550,
                'is3D': true
            };

            var chart = new google.visualization.PieChart(document.getElementById('pie_chart_byErrorType'));
            chart.draw(data, options);
        }
        function drawChartByStatus() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Статус дефекта');
            data.addColumn('number', 'Количество');
            data.addRows([
                [ 'Открыт', ${statisticByStatus.get("Opened")} ],
                [ 'В прогрессе', ${statisticByStatus.get("In progress")}],
                [ 'Исправлен Dev', ${statisticByStatus.get("Resolved")} ],
                [ 'Закрыт', ${statisticByStatus.get("Closed")} ],
                [ 'Требует дополнения', ${statisticByStatus.get("TBR")} ],
                [ 'Отложен', ${statisticByStatus.get("Postponed")} ],
                [ 'Переоткрыт', ${statisticByStatus.get("Reopened")} ]
            ]);

            var options = {
                'title': 'Статистика по статусу дефекта',
                'width': 1000,
                'height': 550,
                'is3D': true,
                 pieHole: 0.4
            };

            var chart = new google.visualization.PieChart(document.getElementById('donut_chart_byStatus'));
            chart.draw(data, options);
        }
        function drawLineChartByTime() {
            var data = google.visualization.arrayToDataTable([
                ['Месяц', 'Количество дефектов'],
                ['Январь',  ${statisticByMonth.get("01")}],
                ['Февраль',  ${statisticByMonth.get("02")}],
                ['Март',  ${statisticByMonth.get("03")}],
                ['Апрель',  ${statisticByMonth.get("04")}],
                ['Май',  ${statisticByMonth.get("05")}],
                ['Июнь',  ${statisticByMonth.get("06")}],
                ['Июль',  ${statisticByMonth.get("07")}],
                ['Август',  ${statisticByMonth.get("08")}],
                ['Сентябрь',  ${statisticByMonth.get("09")}],
                ['Октябрь',  ${statisticByMonth.get("10")}],
                ['Ноябрь',  ${statisticByMonth.get("11")}],
                ['Декабрь',  ${statisticByMonth.get("12")}]
            ]);

            var options = {
                title: 'Статистика дефектов по месяцам',
                hAxis: {
                    title: 'Месяц'
                },
                vAxis: {
                    title: 'Количество'
                },
                curveType: 'function',
                legend: { position: 'bottom' },
                'width': 1100,
                'height': 450
            };

            var chart = new google.visualization.LineChart(document.getElementById('line_chart'));

            chart.draw(data, options);
        }
        function drawChartByAssignee() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Назначен на');
            data.addColumn('number', 'Количество');
            data.addRows([
                [ 'Команда разработчиков', ${statisticByAssignee.get("Developer")} ],
                [ 'Команда тестировщиков', ${statisticByAssignee.get("QA")} ],
                [ 'Бэклог', ${statisticByAssignee.get("Backlog")} ],
                [ 'Другие', ${statisticByAssignee.get("Other")} ]
            ]);

            var options = {
                'title': 'Статистика по назначеннным на группу дефектам',
                'width': 1000,
                'height': 550,
                'is3D': true
            };

            var chart = new google.visualization.PieChart(document.getElementById('donut_chart_byAssignee'));
            chart.draw(data, options);
        }
    </script>

<head>
<body>
<div id="wrapper">
    <c:import url="template.jsp"></c:import>

        <div id="page-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Статистика дефектов</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="glyphicon glyphicon-home"></i><a href="/mainmenu" target="_blank"> Главное меню</a>
                            </li>
                            <li>
                                <a href="<c:url value="/issueController/issues"/>" target="_blank"><i class="glyphicon glyphicon-th-list"></i> Дефекты</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-fw fa-bar-chart-o"></i> Статистика дефектов
                            </li>
                        </ol>
                    </div>
                </div>
                <section class="color-5">
                    <div class="cl-effect-2">
                        <a id="linkByIssue"><span data-hover="По типу вопроса">По типу вопроса</span></a>
                        <a id="linkByDefect"><span data-hover="По типу дефекта">По типу дефекта</span></a>
                        <a id="linkByStatus"><span data-hover="По статусу дефекта">По статусу дефекта</span></a>
                        <a id="linkByAssignee"><span data-hover="По назначенной группе">По назначенной группе</span></a>
                        <a id="linkByTime"><span data-hover="Активности за год">Активности за год</span></a>
                    </div>
                </section>
                <div class="charts">
                    <div id="main"><h1>Выберите статистику для просмотра</h1></div>
                    <div id="pie_chart" style="display:none"></div>
                    <div id="pie_chart_byErrorType" style="display:none"></div>
                    <div id="donut_chart_byStatus" style="display:none"></div>
                    <div id="donut_chart_byAssignee" style="display:none"></div>
                    <div id="line_chart" style="display:none"></div>
                </div>

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