$(document).ready(function() {
    $('.icon-spinner').hide();
    $('.edit_email_notification select').change(function() {
        
        var form_id = $(this).closest('form').attr("id");
          id = form_id.split("_")[3]
        var spinner_id = "#spinner-" + id;

        $(spinner_id).show();
        $(spinner_id).fadeOut(1000);
        
        $(this).closest('form').submit();
    });
    $('.edit_email_notification input[type=checkbox]').click(function() {
        var form_id = $(this).closest('form').attr("id");
            id = form_id.split("_")[3]
        var spinner_id = "#spinner-" + id;
    
        $(spinner_id).show();
        $(spinner_id).fadeOut(1000);
    
        $(this).closest('form').submit();
    });
    $('.edit_settings select').change(function() {
      
        var form_id = $(this).closest('form').attr("id");
          id = form_id.split("_")[3]
        var spinner_id = "#spinner-" + id;

        $(spinner_id).show();
        $(spinner_id).fadeOut(1000);
      
        $(this).closest('form').submit();
  });
});