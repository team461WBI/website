// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require fullcalendar
//= require twitter/bootstrap
//= require jquery-fileupload
//= require_tree .

$(".selectpicker").selectpicker({
	btnStyle: "btn-info"
});

bootstrap_alert_success = function(message) {
	$(".alerts-holder").html("<div class=\"alert alert-sucess\">" +
							 "<a class=\"close\" data-dismiss=\"alert\">×</a>" +
							 "<span>" + message + "</span>" +
							 "</div>");
}

function toggleSticky() {
	if(document.getElementById("comment_sticky").checked) {
		document.getElementById("comment_important").disabled = true;
		document.getElementById("comment_important").checked = true;
	} else {
		document.getElementById("comment_important").disabled = false;
	}
}

$(function() {
	$(".datetimepicker").datetimepicker({
		language: "en",
		pick12HourFormat: false
	});
});
//$(#theCarousel).carousel
