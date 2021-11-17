$(document).on("click",".showLink", function (e) {
    $(".filters_block input").toggle();
    $(".filters_block input").select();
    document.execCommand("copy");
});
