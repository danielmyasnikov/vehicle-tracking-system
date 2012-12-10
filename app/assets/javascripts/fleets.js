$(document).ready(function() {
	if ($("#fleet_auto_services").is(':checked')){
		$("#fleet_period").removeAttr("disabled");
		$("#fleet_km_estimates").removeAttr("disabled");
		$("#fleet_service_frequency_number").removeAttr("disabled");
		$("#fleet_service_frequency_period").removeAttr("disabled");
	} else {
		$("#fleet_period").attr("disabled", "disabled");
		$("#fleet_km_estimates").attr("disabled", "disabled");
		$("#fleet_service_frequency_number").attr("disabled", "disabled");
		$("#fleet_service_frequency_period").attr("disabled", "disabled");
	};
	
	$("#fleet_auto_services").click(function(){
		if ($("#fleet_auto_services").is(':checked')){
			$("#fleet_period").removeAttr("disabled");
			$("#fleet_km_estimates").removeAttr("disabled");
			$("#fleet_service_frequency_number").removeAttr("disabled");
			$("#fleet_service_frequency_period").removeAttr("disabled");
			is_even = false;
		} else {
			$("#fleet_period").attr("disabled", "disabled");
			$("#fleet_km_estimates").attr("disabled", "disabled");
			$("#fleet_service_frequency_number").attr("disabled", "disabled");
			$("#fleet_service_frequency_period").attr("disabled", "disabled");
			is_even = true;
		}
	});
});