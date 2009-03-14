jQuery(function($) {
  $('#add_style').bind('click', function(e) {
    $.ajax({
      type: 'GET',
      url: e.target['rel'],
      success: function(result) {
        $(result).appendTo('#styles');
      }
    });
    return false;
  });

  $('#create_sample_button').bind('click', function(e) {
    $('#sample_image').empty();
    $('#sample_spinner').show();
    url = 'preview_image?zoom_level=' + $('#zoom_level').val() + '&center_lon=' + $('#center_lon').val() + '&center_lat=' + $('#center_lat').val();
    $.getJSON(url, function(json) {
      image = $('<image src="' + json['path'] + '"/>');
      $('#sample_image').append(image);
      $('#sample_spinner').hide();
    });
  });

  $('.sortable_list').sortable({ items: '.sortable_item' });
  $('.sortable_list').disableSelection();

  $('.sortable_list').bind('sortstop', function(event, ui) {
    $.ajax({
      type: 'PUT',
      url: 'layers/sort',
      data: {
        ids: '' + $('.sortable_list').sortable('toArray'),
        authenticity_token: window._token
      },
      success: function(data) {
      }
    });
  });
  var f = $.farbtastic('#color_picker');
  var p = $('#color_picker');
  $('.farbtastic').hide();
  var selected;
  $('.colorwell')
    .each(function () { f.linkTo(this); })
    .focus(function() {
      $('.farbtastic').show();
      // if (selected) {
      //  $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
      // }
      f.linkTo(this);
      // p.css('opacity', 1);
      $('.farbtastic').css('top', $(this).position().top + $(this).height() + 15);
      $('.farbtastic').css('left', $(this).position().left);
      $(selected = this).css('opacity', 1).addClass('colorwell-selected');
    }).blur(function() {
      $('.farbtastic').hide();
    });
});
