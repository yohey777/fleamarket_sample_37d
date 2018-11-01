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
