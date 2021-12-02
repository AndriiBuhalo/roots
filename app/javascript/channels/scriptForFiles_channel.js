$(document).on('change', '#inputFile', function (e) {
  let file = e.target.files[0];
  let count = $('.nested-fields').find('#inputFile').index($(this));
  document.querySelectorAll('.custom-file-label')[count].innerHTML = file.name;
 });
