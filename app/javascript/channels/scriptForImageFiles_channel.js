$(document).on("click",".showLink", function (e) {
  $(".showInput").toggle();
  $(".showInput").select();
  document.execCommand("copy");
});

$(document).on('change', '#inputFile', function (e) {
  var file = e.target.files[0];
  var count = $('.nested-fields').find('#inputFile').index($(this));
  document.querySelectorAll('.custom-file-label')[count].innerHTML = file.name;
 });
