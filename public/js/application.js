$(document).ready(function() {
  getRegForm();
  getCharForm();
  addChar();
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

var getCharForm = function(){
  $("#char-list").on('submit', '#char-button', function(e){
    e.preventDefault();
    var $form = $(this);
    var methodType = $form.attr('method');
    var route = $form.attr('action');

    $.ajax({
      url: route,
      method: methodType
    })
    .done(function(charForm){
      $('#char-list').append(charForm);
      $form.hide();
    })
    .fail(function(){
      console.log("couldnt get char form")
    })
  })
}

var addChar = function(){
  $('#char-list').on('submit', '#new-char', function(e){
    e.preventDefault();
    var $form = $(this);
    var methodType = $form.attr('method');
    var route = $form.attr('action');
    var info = $form.serialize();

    $.ajax({
      url: route,
      method: methodType,
      data: info
    })
    .done(function(newChar){
      $('#char-list').prepend(newChar);
      $form.remove();
      $('#char-button').show();
    })
    .fail(function(){
      console.log("couldnt get new char")
    })
  })
}
