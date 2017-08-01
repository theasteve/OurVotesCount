// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
  $("#attend").on("click",function(event){
  event.preventDefault()
  var $that = $(this)

    $.ajax({
        type: 'POST',
        url: $(event.target).parent().attr('action')
    }).done(function(res){
      var $row = $that.parent().parent()
      var $attend = $that.parent().siblings('#questions')

      $("#attend").parent().html('<h3>Attending</h3>');
      $($attend).show();
      //
      });
  })

  $("#unattend").on("click",function(event){
    event.preventDefault()
    var $this = $(this)
    $.ajax({
      type: 'DELETE',
      url: $this.parent().attr('action')
    }).done(function(response){
      $('#questions').hide();
      $('#questions').parent().children().children().remove()
    })
  })
});
