$(document).on('change', '#inputFile', function (e) {
  var file = e.target.files[0];
  var count = $('.nested-fields').find('#inputFile').index($(this));
  document.querySelectorAll('.custom-file-label')[count].innerHTML = file.name;
  $('#attachment_file_name').val(file.name);
  $('.file_name').show();
 });

 $(document).ready(function() {
   $('#attachment_file_name').keyup(function (e) {
     $('.custom-file-label').html($(this).val());
   });
 });
