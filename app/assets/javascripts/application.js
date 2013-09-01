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
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require highcharts
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require moment

var shown_help = false
function remove_fields(link) {
  
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
  if (true) {
      shown_help = true;
      $("#myModal").modal('show');
  }
}
$(document).ready(function(){
    $('.datepicker').datepicker({
    	format: 'dd-mm-yyyy'
    });
    $('.timepicker').timepicker();
    $('.datatable').dataTable({
      "aLengthMenu": [[3, 5, 10, 50, -1], [3, 5, 10, 50, "All"]],
      "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
      "sPaginationType": "bootstrap"
    });    
})
