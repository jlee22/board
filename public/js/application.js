$(document).ready(function() {
  $('#edit-user-button').on('click',function() {
    event.preventDefault();
    $('#edit-user-button').addClass('hidden');
    $('#edit-user-string').removeClass('hidden');
    $('#edit-user-form').removeClass('hidden');
  });
  $('#edit-user-form').on('submit',function() {
    event.preventDefault();
    $('#edit-user-button').removeClass('hidden');
    $('#edit-user-string').addClass('hidden');
    $('#edit-user-form').addClass('hidden');
  });
});
