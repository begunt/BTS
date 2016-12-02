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

    $('#radioName').change(function() {
        if($("#radioName").is(":checked")) {
            $("#inputIdProject").val('');
            $("#inputIdProject").prop('disabled', true);
            $("#inputName").prop('disabled', false);
            $("#inputDescription").val('');
            $("#inputDescription").prop('disabled', true);
        }
    });
    $('#radioIdProject').change(function() {
        if($("#radioIdProject").is(":checked"))
        {
            $("#inputIdProject").prop('disabled', false);
            $("#inputName").val('');
            $("#inputName").prop('disabled', true);
            $("#inputDescription").val('');
            $("#inputDescription").prop('disabled', true);
        }
    });
    $('#radioDescription').change(function() {
        if($("#radioDescription").is(":checked"))
        {
            $("#inputDescription").val('');
            $("#inputIdProject").prop('disabled', true);
            $("#inputName").val('');
            $("#inputName").prop('disabled', true);
            $("#inputDescription").prop('disabled', false);
        }
    });

    $('#checkboxName').change(function() {
        if($("#checkboxName").is(":checked")) {
            $("#inputNameFilter").prop('disabled', false);
        }
        else {
            $("#inputNameFilter").val('');
            $("#inputNameFilter").prop('disabled', true);
        }
    });
    $('#checkboxDescription').change(function() {
        if($("#checkboxDescription").is(":checked")) {
            $("#inputDescriptionFilter").prop('disabled', false);
        }
        else {
            $("#inputDescriptionFilter").val('');
            $("#inputDescriptionFilter").prop('disabled', true);
        }
    });
});