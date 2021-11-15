$( document ).ready(function() {

  $(document).on("click",".albums", function (e) {
    $(".showAlbums").toggle("easing");
  });

  $(document).on("click",".showLink", function (e) {
    $(".info input").toggle();
    $(".info input").select();
    document.execCommand("copy");
  });

  });
