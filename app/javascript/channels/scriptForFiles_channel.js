$(document).on('change', '.custom-file-input', function (e) {
  let file = e.target.files[0];
  let count = $('.input-group').find('.custom-file-input').index($(this));
  document.querySelectorAll('.custom-file-label')[count].innerHTML = file.name;
 });
