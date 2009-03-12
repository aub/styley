jQuery(function($) {
  $('#add_style').bind('click', function(e) {
    clone = $($('.style_block')[0]).clone();
    clone.prependTo($('#styles'));
    return false;
  });

  $('#create_sample_button').bind('click', function(e) {
    url = 'preview_image?zoom_level=' + $('#zoom_level').val() + '&center_lon=' + $('#center_lon').val() + '&center_lat=' + $('#center_lat').val();
    $.getJSON(url, function(json) {
      image = $('<image src="' + json['path'] + '"/>');
      $('#sample_image').empty();
      $('#sample_image').append(image);
    });
  });
});
