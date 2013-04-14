$(document).ready(function() {
	if ($("#fleet_auto_services").is(':checked')){
		$('.auto_services').find('input, textarea, button, select, .btn, .disabled').removeAttr("disabled").removeClass("disabled");
	} else {
		$('.auto_services').find('input, textarea, button, select, .btn').attr('disabled','disabled');
	};
	
	$("#fleet_auto_services").click(function(){
		if ($("#fleet_auto_services").is(':checked')){
			$('.auto_services').find('input, textarea, button, select, .btn, .disabled').removeAttr("disabled").removeClass("disabled");
			is_even = false;
		} else {
			$('.auto_services').find('input, textarea, button, select, .btn').attr('disabled','disabled');
			is_even = true;
		}
	});
});