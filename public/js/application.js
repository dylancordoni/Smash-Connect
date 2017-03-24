$(document).ready(function() {
  getRegForm();
});

var getRegForm = function(){
  $("#registration").on('submit', '#reg-button', function(e){
    e.preventDefault();
    var $form = $(this);
    var methodType = $form.attr('method');
    var route = $form.attr('action');

    $.ajax({
      url: route,
      method: methodType
    })
    .done(function(regForm){
      $('#registration').append(regForm)
      $form.hide();
    })
    .fail(function(){
      console.log("couldnt get reg form")
    })
  })
}
