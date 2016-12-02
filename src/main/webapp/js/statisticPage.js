/**
 * Created by tbegu_000 on 22.11.2016.
 */
$(window).load(function () {

    $('#linkByIssue').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#pie_chart").css("display","block");
        $("#pie_chart_byErrorType").css("display","none");
        $("#donut_chart_byStatus").css("display","none");
        $("#donut_chart_byAssignee").css("display","none");
        $("#line_chart").css("display","none");

    });
    $('#linkByDefect').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#pie_chart").css("display","none");
        $("#pie_chart_byErrorType").css("display","block");
        $("#donut_chart_byStatus").css("display","none");
        $("#donut_chart_byAssignee").css("display","none");
        $("#line_chart").css("display","none");

    });
    $('#linkByStatus').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#pie_chart").css("display","none");
        $("#pie_chart_byErrorType").css("display","none");
        $("#donut_chart_byStatus").css("display","block");
        $("#donut_chart_byAssignee").css("display","none");
        $("#line_chart").css("display","none");

    });
    $('#linkByAssignee').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#pie_chart").css("display","none");
        $("#pie_chart_byErrorType").css("display","none");
        $("#donut_chart_byStatus").css("display","none");
        $("#donut_chart_byAssignee").css("display","block");
        $("#line_chart").css("display","none");

    });
    $('#linkByTime').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#pie_chart").css("display","none");
        $("#pie_chart_byErrorType").css("display","none");
        $("#donut_chart_byStatus").css("display","none");
        $("#donut_chart_byAssignee").css("display","none");
        $("#line_chart").css("display","block");

    });

    $('#linkFilter').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#search").css("display","none");
        $("#filter").css("display","block");
        $("#searchTable").css("display","none");
        $("#filterTable").css("display","block");
    });
    $('#linkSearch').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#filter").css("display","none");
        $("#search").css("display","block");
        $("#searchTable").css("display","block");
        $("#filterTable").css("display","none");
    });

    $('#radioSummary').change(function() {
        if($("#radioSummary").is(":checked")) {
            $("#inputSummary").prop('disabled', false);
            $("#areaDescription").val('');
            $("#areaDescription").prop('disabled', true);
            $("#inputIdIssue").val('');
            $("#inputIdIssue").prop('disabled', true);
            $("#inputDate").val('');
            $("#inputDate").prop('disabled', true);
        }/*
        else {
            $("#inputSummary").val('');
            $("#inputSummary").prop('disabled', true);
        }*/
    });
    $('#radioDescription').change(function() {
        if($("#radioDescription").is(":checked"))
        {
            $("#inputSummary").val('');
            $("#inputSummary").prop('disabled', true);
            $("#areaDescription").prop('disabled', false);
            $("#inputIdIssue").val('');
            $("#inputIdIssue").prop('disabled', true);
            $("#inputDate").val('');
            $("#inputDate").prop('disabled', true);
        }
    });
    $('#radioIdIssue').change(function() {
        if($("#radioIdIssue").is(":checked"))
        {
            $("#inputSummary").val('');
            $("#inputSummary").prop('disabled', true);
            $("#areaDescription").val('');
            $("#areaDescription").prop('disabled', true);
            $("#inputIdIssue").prop('disabled', false);
            $("#inputDate").val('');
            $("#inputDate").prop('disabled', true);
        }
    });
    $('#radioDate').change(function() {
        if($("#radioDate").is(":checked"))
        {
            $("#inputSummary").val('');
            $("#inputSummary").prop('disabled', true);
            $("#areaDescription").val('');
            $("#areaDescription").prop('disabled', true);
            $("#inputIdIssue").val('');
            $("#inputIdIssue").prop('disabled', true);
            $("#inputDate").prop('disabled', false);
        }

    });


    $('#checkboxProject').change(function() {
        if($("#checkboxProject").is(":checked")) {
            $("#selectProject").prop('disabled', false);
        }
        else {
            $("#selectProject").val('0');
            $("#selectProject").prop('disabled', true);
        }
    });
    $('#checkboxEmployee').change(function() {
        if($("#checkboxEmployee").is(":checked")) {
            $("#selectEmployee").prop('disabled', false);
        }
        else {
            $("#selectEmployee").val('0');
            $("#selectEmployee").prop('disabled', true);
        }
    });
    $('#checkboxIssueType').change(function() {
        if($("#checkboxIssueType").is(":checked")) {
            $("#selectIssueType").prop('disabled', false);
        }
        else {
            $("#selectIssueType").val('0');
            $("#selectIssueType").prop('disabled', true);
        }
    });
    $('#checkboxPriority').change(function() {
        if($("#checkboxPriority").is(":checked")) {
            $("#selectPriority").prop('disabled', false);
        }
        else {
            $("#selectPriority").val('0');
            $("#selectPriority").prop('disabled', true);
        }
    });
    $('#checkboxStatus').change(function() {
        if($("#checkboxStatus").is(":checked")) {
            $("#selectStatus").prop('disabled', false);
        }
        else {
            $("#selectStatus").val('0');
            $("#selectStatus").prop('disabled', true);
        }
    });
    $('#checkboxSeverity').change(function() {
        if($("#checkboxSeverity").is(":checked")) {
            $("#selectSeverity").prop('disabled', false);
        }
        else {
            $("#selectSeverity").val('0');
            $("#selectSeverity").prop('disabled', true);
        }
    });
    $('#checkboxErrorType').change(function() {
        if($("#checkboxErrorType").is(":checked")) {
            $("#selectErrorType").prop('disabled', false);
        }
        else {
            $("#selectErrorType").val('0');
            $("#selectErrorType").prop('disabled', true);
        }
    });
    $('#checkboxAssignee').change(function() {
        if($("#checkboxAssignee").is(":checked")) {
            $("#selectAssignee").prop('disabled', false);
        }
        else {
            $("#selectAssignee").val('0');
            $("#selectAssignee").prop('disabled', true);
        }
    });
});