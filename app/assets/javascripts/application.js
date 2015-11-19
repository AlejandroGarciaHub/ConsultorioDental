// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require moment
//= require fullcalendar
//= require moment/es
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require_tree .



$(document).on('page:change',function() {
    $('#appointment_fecha').datetimepicker({
        format: "YYYY/MM/DD HH:mm a",
        sideBySide: true,
        minDate: moment().add('d', 5).toDate(),
        daysOfWeekDisabled: ["0","6"],
        useCurrent: false,
        icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down",
                    previous: "fa fa-arrow-left",
                    next: "fa fa-arrow-right",
                    today: 'glyphicon glyphicon-screenshot',
                    clear: 'glyphicon glyphicon-trash',
                    close: 'glyphicon glyphicon-remove'
                }
    });
});

$(document).on('page:change',function() {
    $.fn.datepicker.dates['en'] = {
    days:['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
    months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    today: "Hoy",
    clear: "Limpiar",
    format: "yyyy/mm/dd",
    titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
    weekStart: 0
};
    return $('#patient_fechaNac').datepicker({
    });
});


$(document).on('page:change',function() {
    $('#appointment_patient_nombre').autocomplete({
    source: $('#appointment_patient_nombre').data('autocomplete-source'),
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      return $('#patient_id').val(ui.item.value);
    }
  });
});

$(document).on('page:change',function(){
    $("#filter").keyup(function(){
 
        // Retrieve the input field text and reset the count to zero
        var filter = $(this).val(), count = 0;
 
        // Loop through the comment list
        $(".patientlist div.margin-patient").each(function(){
 
            // If the list item does not contain the text phrase fade it out
            if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                $(this).fadeOut();
 
            // Show the list item if the phrase matches and increase the count by 1
            } else {
                $(this).show();
                count++;
            }
        });
 
        // Update the count
        var numberItems = count;
        $("#filter-count").text("Numero de coincidencias = "+count);
    });
});

$(document).on('page:change',function(){
    $("#calendarCita").fullCalendar({
        buttonText: {
          today: 'Hoy',
          month: 'Mes',
          week: 'Semana',
          day: 'Dia'
    },
    allDayText: 'Todo el dia',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
        header: { 
            center: 'month,agendaWeek' 
        },
        views: {
            month: { // name of view
                editable: false,
                eventLimit: 3,
            }
        },
        defaultView: 'agendaWeek',
        events: '/citas.json'
    });
});

$(document).on('page:change',function(){
    $("#calendar").fullCalendar({
        buttonText: {
          today: 'Hoy',
          month: 'Mes',
          week: 'Semana',
          day: 'Dia'
    },
    allDayText: 'Todo el dia',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
        header: { 
            center: 'month,agendaWeek' 
        },
        views: {
            month: { // name of view
                editable: false,
                eventLimit: 3,
            }
        },
        events: '/citas.json'
    });
});