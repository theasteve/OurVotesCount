$( document ).ready(function() {
  $("#attend").on("click",function(event){
  event.preventDefault()
  debugger
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
