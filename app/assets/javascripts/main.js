$(function(){
  $("li.mypageList").click(function(e){
    $("li.mypageList").removeClass("active");
    $(this).addClass("active");
    e.preventDefault();
  });
});
$(function(){
  $("li.trading-tabs").click(function(e){
    $("li.trading-tabs").removeClass("active");
    $(this).addClass("active");
    $("ul.tab-pane").removeClass("active");
    $("li#trading-tab-list").addClass("active");
    var index = $(this).index();
    index +=1
    $(".mypage-container__tradings-contents ul:nth-child("+index+")" ).addClass("active");
    e.preventDefault();
  });
});
$(function(){
  $(".owl-dots li").mouseover(function(e){
    $(".owl-item").removeClass("active");
    $(".owl-dot").removeClass("active");
    $(this).addClass("active");
    var index = $(this).index();
    index = index * -300 + "px"
    $(".owl-stage").animate({left: index},500);
    e.preventDefault();
  });
});
Dropzone.autoDiscover = false;
var headlineDropzone = new Dropzone("#upload-dropzone", {
  url: "/upload_photo", // You can override url of form in here.
  maxFilesize: 5, // in MB
  parallelUploads: 2,
  acceptedFiles:'.jpg, .png, .jpeg, .gif', // type of files
  init: function(){
    this.on('addedfile', function(file) {
      // Called when a file is added to the list.
    });
    this.on('sending', function(file, xhr, formData) {
      // Called just before each file is sent.
    });
    this.on('success', function(file, json) {
      // Called when file uploaded successfully.
    });
  }
});
