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
});
