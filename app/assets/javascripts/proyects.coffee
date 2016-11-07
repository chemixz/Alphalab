# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( "#datepicker" ).datepicker({
	
	inline: true,
	dateFormat: 'dd/mm/yy',
	monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
	monthNamesShort: [ "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
	changeYear: true,
	changeMonth: true,
	minDate: '0d',
	yearRange: "+0:+20"
});
$( "#datepicker2" ).datepicker({
	
	inline: true
	dateFormat: 'dd/mm/yy',
	monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
	monthNamesShort: [ "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
	changeYear: true,
	changeMonth: true,
	minDate: '0d',
	yearRange: "+0:+20"
});

