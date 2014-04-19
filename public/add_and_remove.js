$( document ).ready(function() {
  
  var add_frm = $('#new_member');
  add_frm.submit(function (ev) {
      $.ajax({
          type: add_frm.attr('method'),
          url: add_frm.attr('action'),
          data: add_frm.serialize(),
          success: function (data) {
              $('#members ul').append( $('<li>').append(data));
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
              $('#liid' + data).remove();
          }
      });
      ev.preventDefault();
  });
});
