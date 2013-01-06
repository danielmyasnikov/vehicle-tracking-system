$(document).ready(function() {
	if ($("#fleet_auto_services").is(':checked')){
		$("#fleet_service_frequency_number").removeAttr("disabled");
		$("#fleet_service_frequency_period").removeAttr("disabled");
		$("#fields_1_service_km_interval").removeAttr("disabled");
		$("#fields_2_service_km_interval").removeAttr("disabled");
		$("#fields_3_service_km_interval").removeAttr("disabled");
		$("#fields_1_service_time_interval").removeAttr("disabled");
		$("#fields_2_service_time_interval").removeAttr("disabled");
		$("#fields_3_service_time_interval").removeAttr("disabled");
		$("#fields_1_service_period").removeAttr("disabled");
		$("#fields_2_service_period").removeAttr("disabled");
		$("#fields_3_service_period").removeAttr("disabled");
	} else {
		$("#fields_1_service_km_interval").attr("disabled", "disabled");
		$("#fields_2_service_km_interval").attr("disabled", "disabled");
		$("#fields_3_service_km_interval").attr("disabled", "disabled");
		$("#fields_1_service_time_interval").attr("disabled", "disabled");
		$("#fields_2_service_time_interval").attr("disabled", "disabled");
		$("#fields_3_service_time_interval").attr("disabled", "disabled");
		$("#fields_1_service_period").attr("disabled", "disabled");
		$("#fields_2_service_period").attr("disabled", "disabled");
		$("#fields_3_service_period").attr("disabled", "disabled");
		$("#fleet_service_frequency_number").attr("disabled", "disabled");
		$("#fleet_service_frequency_period").attr("disabled", "disabled");
	};
	
	$("#fleet_auto_services").click(function(){
		if ($("#fleet_auto_services").is(':checked')){
			$("#fleet_service_frequency_number").removeAttr("disabled");
			$("#fleet_service_frequency_period").removeAttr("disabled");
			$("#fields_1_service_km_interval").removeAttr("disabled");
			$("#fields_2_service_km_interval").removeAttr("disabled");
			$("#fields_3_service_km_interval").removeAttr("disabled");
			$("#fields_1_service_time_interval").removeAttr("disabled");
			$("#fields_2_service_time_interval").removeAttr("disabled");
			$("#fields_3_service_time_interval").removeAttr("disabled");
			$("#fields_1_service_period").removeAttr("disabled");
			$("#fields_2_service_period").removeAttr("disabled");
			$("#fields_3_service_period").removeAttr("disabled");
			is_even = false;
		} else {
			$("#fields_1_service_km_interval").attr("disabled", "disabled");
			$("#fields_2_service_km_interval").attr("disabled", "disabled");
			$("#fields_3_service_km_interval").attr("disabled", "disabled");
			$("#fields_1_service_time_interval").attr("disabled", "disabled");
			$("#fields_2_service_time_interval").attr("disabled", "disabled");
			$("#fields_3_service_time_interval").attr("disabled", "disabled");
			$("#fields_1_service_period").attr("disabled", "disabled");
			$("#fields_2_service_period").attr("disabled", "disabled");
			$("#fields_3_service_period").attr("disabled", "disabled");
			$("#fleet_service_frequency_number").attr("disabled", "disabled");
			$("#fleet_service_frequency_period").attr("disabled", "disabled");
			is_even = true;
		}
	});
});