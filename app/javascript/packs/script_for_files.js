$(document).on('change', '.custom-file-input', function (e) {
  let file = e.target.files[0];
  let count = $('.input-group').find('.custom-file-input').index($(this));
  $("body").find('.custom-file-label')[count].html(file.name);
 });
