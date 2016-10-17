$(document).ready(function() {
  $('#edit-user-button').on('click',function() {
    event.preventDefault();
    $('#edit-user-button').addClass('hidden');
    $('#edit-user-string').removeClass('hidden');
    $('#edit-user-form').removeClass('hidden');
  });
  $('#edit-user-form').on('submit',function() {
    $('#edit-user-button').removeClass('hidden');
    $('#edit-user-string').addClass('hidden');
    $('#edit-user-form').addClass('hidden');
    // event.preventDefault();
  });
  hostGameButtonListener();
});


var hostGameButtonListener = function() {
  $('#host-game-button').on('click', function(event) {
    event.preventDefault();
    var postFormTarget = $(this);
    var address = postFormTarget.attr('href');
    var data = postFormTarget.attr('href');
    // $('#host-game-button').addClass('hidden')
    var request = $.ajax({
        url: address,
        method: "get",
        data: data
      });

      request.done(function(response) {
        // append response to individual horse
        console.log(response)
        $('#title-div').append('<p>' + response + '</p');
      });

      request.fail(function(response) {
        alert("You fucked it up!");
      });

  })
};

