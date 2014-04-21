$( document ).ready(function() {
  
  var add_frm = $('#new_member');
  add_frm.submit(function (ev) {
      $.ajax({
          type: add_frm.attr('method'),
          url: add_frm.attr('action'),
          data: add_frm.serialize(),
          success: function (data) {
              $('<li>').append(data).hide().prependTo($('#members ul')).slideDown('slow');
          }
      });
      ev.preventDefault();
  });


  $('ul.list').delegate('a', 'click', function (ev) {
      $.ajax({
          type: 'DELETE',
          url: '/remove_member',
          data: {
            "membre[id]" : $(this).attr("data-id")
            },
          success: function (data) {
              $('#liid' + data).animate({
                  height: '0px'
              }, {
                  duration: 1000,
                  complete: function() {
                      $(this).remove();
                  }
              });
          }
      });
      ev.preventDefault();
  });
});
