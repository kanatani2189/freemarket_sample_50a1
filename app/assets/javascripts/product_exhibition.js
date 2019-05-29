$(function(){

// 価格表示
  $('.item_example').on('keyup', function(){
    var $price = $(this).val();
    if ($price >= 300 && $price < 10000000) {
        var $fee = Math.floor($price / 10);
        var $fee_comma = $fee.toLocaleString();
        $('.item-main-price__center--minus').text('¥' + $fee_comma);
        var $profit = Math.ceil(($price - ($price / 10)));
        var $profit_comma = $profit.toLocaleString();
        $('.item-main-price__bottom--minus').text('¥' + $profit_comma); 
    } else {
        $('.item-main-price__center--minus').text('ー');
        $('.item-main-price__bottom--minus').text('ー');
    }
    
  })


// カテゴリ
$('.item-main-state__box__category__select__name').on('change', function(){
  var ary = [];
  var large_category = $(this).val();
  var midiums = $('.item-main-state__box__category__select__name1').children();
  for(var i = 0; i < midiums.length; i++) {
      var type = midiums[i].value;
      if ((large_category === "レディース") && (type !== "---") && (type !== "トップス") && (type !== "ジャケット")) {
        midiums.splice(i, 1);
      }  
      else if ((large_category === "メンズ") && (type !== "---") && (type !== "パンツ") && (type !== "スカート")){
        midiums.splice(i, 1);
      }    
      else {
          ary.push(midiums[i]);
        } 
      }
      $('.item-main-state__box__category__select__name1').children().remove();
      $('.item-main-state__box__category__select__name1').prepend(ary);
      $('.item-main-state__box__category__select__name1').css('display', 'block').val("---");
});

$('.item-main-state__box__category__select__name1').on('change', function(){
  var ary = [];
  var large_category = $(this).val();
  var midiums = $('.item-main-state__box__category__select__name2').children();
  for(var i = 0; i < midiums.length; i++) {
      var type = midiums[i].value;
      if ((large_category === "トップス" || large_category === "ジャケット") && (type !== "---") && (type !== "Tシャツ") && (type !== "ポロシャツ")) {
        midiums.splice(i, 1);
      } 
      else if ((large_category === "パンツ" || large_category === "スカート") && (type !== "---") && (type !== "キャミソール") && (type !== "タンクトップ")){
        midiums.splice(i, 1);
      }
      else {
          ary.push(midiums[i]);
        }
      }
      $('.item-main-state__box__category__select__name2').children().remove();
      $('.item-main-state__box__category__select__name2').prepend(ary);
      $('.item-main-state__box__category__select__name2').css('display', 'block').val("---");
  });
  
});
