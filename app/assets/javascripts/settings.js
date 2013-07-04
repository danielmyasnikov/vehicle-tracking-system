$(document).ready(function() {
  $('.edit_email_notification select').change(function() {
    $(this).closest('form').submit();
  });
  $('.edit_email_notification input[type=checkbox]').click(function() {
    $(this).closest('form').submit();
  });
  $('.edit_settings select').change(function() {
    $(this).closest('form').submit();
  });
});