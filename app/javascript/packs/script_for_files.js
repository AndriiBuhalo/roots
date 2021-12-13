$(document).on('change', '.custom-file-input', function (e) {
  let file = e.target.files[0];
  $(this).siblings('.custom-file-label').text(file.name);
 });
