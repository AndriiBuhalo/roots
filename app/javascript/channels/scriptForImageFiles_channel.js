$( document ).ready(function() {

$(document).on('change', '#file', function (e) {
  $('.ImgFile').attr("src", window.URL.createObjectURL(this.files[0]));
  $('.ImgFile').show();
  $('.borderImgFile .title').hide();
});

$(document).on('change', '.attachments', function (e) {
    var file, fileId, removeLink;

    for (var i = 0, length = e.target.files.length; i < length; i++) {
        fileId = i;
        file = e.target.files[i];

        var removeLink = '<div class="form-attachments__item" data-id="' + fileId + '">' +
            '<div class="form-attachments__item-wrapper">' +
            '<img class="form-attachments__item-image" src="' + window.URL.createObjectURL(this.files[fileId]) + '" alt="' + file.name + '">' +
            '<div class="form-attachments__item-name">' + file.name + '</div>' +
            '<div class="form-attachments__item-size">' + (file.size / 1024).toFixed(1) + 'Кб' + '</div>' +
            '<div class="form-attachments__item-link">×</div>' +
            '</div>' +
            '</div>';
        $('.form-attachments__items').append(removeLink);
    }
});

  $(document).on("click",".form-attachments__item-link", function (e) {
    $(this).closest('.form-attachments__item').remove();
  });

  $(document).on("click",".albums", function (e) {
    $(".showAlbums").toggle("easing");
  });

  $(document).on("click",".showLink", function (e) {
    $(".info input").toggle();
    $(".info input").select();
    document.execCommand("copy");
  });
  
  });
