/*
$(document).ready(function() {
	$.ajax({
		url: "/services/new",
		dataType: "json",
		type: "GET",
		processData: false,
		contentType: "application/json"
	}).done(function ( data ) {
		var trucks = data.truck_ids;
		var ddl_fleet_id = $("#fleet_fleet_id").val();
		if ($.inArray(parseInt($("#fleet_fleet_id").val()), trucks) > -1){
			$("#service_KM_since_last_service").removeAttr("disabled");
			$("#service_time_since_last_service").removeAttr("disabled");
		} else {
			$("#service_KM_since_last_service").attr("disabled", "disabled");
			$("#service_time_since_last_service").attr("disabled", "disabled");
		}
		$("#fleet_fleet_id").change(function(){
			if ($.inArray(parseInt($("#fleet_fleet_id").val()), trucks) > -1) {
				$("#service_KM_since_last_service").removeAttr("disabled");
				$("#service_time_since_last_service").removeAttr("disabled");
			} else {
				$("#service_KM_since_last_service").attr("disabled", "disabled");
				$("#service_time_since_last_service").attr("disabled", "disabled");
			};
		});
	});
});
*/