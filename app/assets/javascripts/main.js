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

//手数料の自動計算
$(function(){
  // ボタンを入力した時の処理
  $('#item_price').keyup( function(e) {
    // 入力フォームの値を取得
    var item_price_value = $("#item_price").val();

    //入力フォームのvalue属性値を変更
    $('#item_price').attr({
      'value': item_price_value
    });
    //文字列を数値に変換
    item_price = parseInt(item_price_value);
    if (item_price >= 300 && item_price <= 9999999){
      // 手数料10%を小数点繰り下げで計算
      var handling_charge = Math.floor(item_price * 0.1);
      $("#handling_charge.l-right").html("¥" + handling_charge);
      var profit_fee =item_price - handling_charge;
      // 計算結果を別の入力フォームに表示
      $("#profitFee.l-right").html("¥" + profit_fee);
    } else {
      $("#handling_charge.l-right").html("-");
      $("#profitFee.l-right").html("-");
    }
    e.preventDefault();
  });
});

