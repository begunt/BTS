/**
 * Created by tbegu_000 on 22.11.2016.
 */
$(window).load(function () {

   /* $('#linkByIssue').click(function( e ) {
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
*/
    $('#linkFilter').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#search").css("display","none");
        $("#filter").css("display","block");;
    });
    $('#linkSearch').click(function( e ) {
        e.preventDefault(); // отменяем стандартное поведение
        $("#main").css("display","none");
        $("#filter").css("display","none");
        $("#search").css("display","block");
    });

    $('#radioFirstName').change(function() {
        if($("#radioFirstName").is(":checked")) {
            $("#inputFirstName").prop('disabled', false);
            $("#inputLastName").val('');
            $("#inputLastName").prop('disabled', true);
            $("#inputLogin").val('');
            $("#inputLogin").prop('disabled', true);
            $("#inputSalary").val('');
            $("#inputSalary").prop('disabled', true);
            $("#inputIdEmployee").val('');
            $("#inputIdEmployee").prop('disabled', true);
        }
    });
    $('#radioLastName').change(function() {
        if($("#radioLastName").is(":checked"))
        {
            $("#inputFirstName").val('');
            $("#inputFirstName").prop('disabled', true);
            $("#inputLastName").prop('disabled', false);
            $("#inputLogin").val('');
            $("#inputLogin").prop('disabled', true);
            $("#inputSalary").val('');
            $("#inputSalary").prop('disabled', true);
            $("#inputIdEmployee").val('');
            $("#inputIdEmployee").prop('disabled', true);
        }
    });
    $('#radioLogin').change(function() {
        if($("#radioLogin").is(":checked"))
        {
            $("#inputFirstName").val('');
            $("#inputFirstName").prop('disabled', true);
            $("#inputLastName").val('');
            $("#inputLastName").prop('disabled', true);
            $("#inputLogin").prop('disabled', false);
            $("#inputSalary").val('');
            $("#inputSalary").prop('disabled', true);
            $("#inputIdEmployee").val('');
            $("#inputIdEmployee").prop('disabled', true);
        }
    });
    $('#radioSalary').change(function() {
        if($("#radioSalary").is(":checked"))
        {
            $("#inputFirstName").val('');
            $("#inputFirstName").prop('disabled', true);
            $("#inputLastName").val('');
            $("#inputLastName").prop('disabled', true);
            $("#inputLogin").val('');
            $("#inputLogin").prop('disabled', true);
            $("#inputSalary").prop('disabled', false);
            $("#inputIdEmployee").val('');
            $("#inputIdEmployee").prop('disabled', true);
        }
    });
    $('#radioIdEmployee').change(function() {
        if($("#radioIdEmployee").is(":checked"))
        {
            $("#inputFirstName").val('');
            $("#inputFirstName").prop('disabled', true);
            $("#inputLastName").val('');
            $("#inputLastName").prop('disabled', true);
            $("#inputLogin").val('');
            $("#inputLogin").prop('disabled', true);
            $("#inputSalary").val('');
            $("#inputSalary").prop('disabled', true);
            $("#inputIdEmployee").prop('disabled', false);
        }
    });


    $('#checkboxFirstName').change(function() {
        if($("#checkboxFirstName").is(":checked")) {
            $("#inputFirstNameFilter").prop('disabled', false);
        }
        else {
            $("#inputFirstNameFilter").val('');
            $("#inputFirstNameFilter").prop('disabled', true);
        }
    });
    $('#checkboxLastName').change(function() {
        if($("#checkboxLastName").is(":checked")) {
            $("#inputLastNameFilter").prop('disabled', false);
        }
        else {
            $("#inputLastNameFilter").val('');
            $("#inputLastNameFilter").prop('disabled', true);
        }
    });
    $('#checkboxSalary').change(function() {
        if($("#checkboxSalary").is(":checked")) {
            $("#inputSalaryFilter").prop('disabled', false);
        }
        else {
            $("#inputSalaryFilter").val('0');
            $("#inputSalaryFilter").prop('disabled', true);
        }
    });
});