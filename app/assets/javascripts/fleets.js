$(document).ready(function() {
	if ($("#fleet_auto_services").is(':checked')){
		$("#fleet_period").removeAttr("disabled");
		$("#fleet_km_estimates").removeAttr("disabled");
	} else {
		$("#fleet_period").attr("disabled", "disabled");
		$("#fleet_km_estimates").attr("disabled", "disabled");
	};
	
	$("#fleet_auto_services").click(function(){
		if ($("#fleet_auto_services").is(':checked')){
			$("#fleet_period").removeAttr("disabled");
			$("#fleet_km_estimates").removeAttr("disabled");
			is_even = false;
		} else {
			$("#fleet_period").attr("disabled", "disabled");
			$("#fleet_km_estimates").attr("disabled", "disabled");
			is_even = true;
		}
	});
});