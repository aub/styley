jQuery(function($) {

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

  installStyleSectionToggles();

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

  $('#add_style').bind('click', function(e) {
    $.ajax({
      type: 'GET',
      url: e.target['rel'],
      success: function(result) {
        $(result).appendTo('#styles');
        installStyleSectionToggles($(result));
        prepareColorwells(farbtastic);
      }
    });
    return false;
  });

  if ($('#color_picker').size() > 0) {
    var farbtastic = $.farbtastic('#color_picker');
    $('.farbtastic').hide();
    prepareColorwells(farbtastic);
  }

  $('.layer_toggle').change(function() {
    $.ajax({
      type: 'PUT',
      url: 'layers/' + $(this).attr('rel'),
      data: {
        'layer[enabled]': ($(this).is(':checked') ? '1' : '0'),
        authenticity_token: window._token
      },
      success: function(data) {
      }
    });
  });
});

function prepareColorwells(farbtastic) {
  $('.colorwell')
    .each(function () { farbtastic.linkTo(this); })
    .focus(function() {
      $('.farbtastic').show();
      farbtastic.linkTo(this);
      $('.farbtastic').css('top', $(this).position().top + $(this).height() + 15);
      $('.farbtastic').css('left', $(this).position().left);
      $(this).addClass('colorwell-selected');
    }).blur(function() {
      $('.farbtastic').hide();
    });
};

function installStyleSectionToggles(item) {
  objects = $('.style_section_toggle');
  objects.unbind('change');
  objects.change(function() {
    $($(this).attr('rel')).slideToggle('fast');
  });
};
