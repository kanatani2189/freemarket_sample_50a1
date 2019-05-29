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
var midiums2 = $('#item-main-state__box__category__select__name1').children();
$('#item-main-state__box__category__select__name').on('change', function(){
  var ary = [];
  var large_category = $(this).val();
  $('#item-main-state__box__category__select__name1').append(midiums2);
  var midiums = $('#item-main-state__box__category__select__name1').children();
  for(var i = 0; i < midiums.length; i++) {
      var type = midiums[i].value;
      if ((large_category === "レディース" || large_category === "メンズ" || large_category === "---") && (type !== "---") && (type !== "トップス") && (type !== "ジャケット/アウター") && (type !== "パンツ") && (type !== "スカート") && (type !== "ワンピース") && (type !== "靴") && (type !== "ルームウェア/パジャマ") && (type !== "レッグウェア") && (type !== "帽子") && (type !== "バッグ") && (type !== "アクセサリー") && (type !== "ヘアアクセサリー") && (type !== "小物")) {
        midiums.splice(i, 1);
      }  
      else if ((large_category === "ベビー・キッズ" || large_category === "---") && (type !== "---") && (type !== "ベビー服（女の子用）〜95cm") && (type !== "ベビー服（男の子用）〜95cm") && (type !== "ベビー服（男女兼用）〜95cm") && (type !== "キッズ服（女の子用）100cm〜") && (type !== "キッズ服（男の子用）100cm〜") && (type !== "キッズ服（男女兼用）100cm〜") && (type !== "キッズ靴") && (type !== "子供用ファッション小物") && (type !== "オムツ/トイレ/バス") && (type !== "外出/移動用") && (type !== "授乳/食事") && (type !== "おもちゃ") && (type !== "行事/記念品")){
        midiums.splice(i, 1);
      }
      // else if (large_category === "---") {
      //   $('#item-main-state__box__first_category__select1').css('display', 'none');
      // }
      else {
          ary.push(midiums[i]);
        } 
      }
      $('#item-main-state__box__category__select__name1').children().remove();
      $('#item-main-state__box__category__select__name1').prepend(ary);
      $('#item-main-state__box__category__select__name1').css('display', 'block').val("---");
});


var midiums3 = $('#item-main-state__box__category__select__name2').children();
$('#item-main-state__box__category__select__name1').on('change', function(){
  var ary = [];
  var midium_category = $(this).val();
  $('#item-main-state__box__category__select__name2').append(midiums3);
  var midiums4 = $('#item-main-state__box__category__select__name2').children();
  for(var i = 0; i < midiums4.length; i++) {
      var type = midiums4[i].value;
      if ((midium_category === "トップス" || midium_category === "ジャケット/アウター" || midium_category === "パンツ" || midium_category === "スカート" || midium_category === "ワンピース" || midium_category === "靴" || midium_category === "ルームウェア/パジャマ" || midium_category === "レッグウェア" || midium_category === "帽子" || midium_category === "バッグ" || midium_category === "アクセサリー" || midium_category === "ヘアアクセサリー" || midium_category === "小物") && (type !== "---") && (type !== "Tシャツ") && (type !== "ポロシャツ") && (type !== "キャミソール") && (type !== "タンクトップ") && (type !== "ホルターネック") && (type !== "ニット/セーター") && (type !== "カーディガン/ボレロ") && (type !== "アンサンブル") && (type !== "ベスト/ジレ") && (type !== "パーカー") && (type !== "トレーナー/スウェット") && (type !== "ベアトップ") && (type !== "ジャージ")) {
        midiums4.splice(i, 1);
      } 
      else if ((midium_category === "ベビー服（女の子用）〜95cm" || midium_category === "ベビー服（男の子用）〜95cm" || midium_category === "ベビー服（男女兼用）〜95cm" || midium_category === "キッズ服（女の子用）100cm〜" || midium_category === "キッズ服（男の子用）100cm〜" || midium_category === "キッズ服（男女兼用）100cm〜" || midium_category === "キッズ靴" || midium_category === "子供用ファッション小物" || midium_category === "オムツ/トイレ/バス" || midium_category === "外出/移動用'" || midium_category === "授乳/食事" || midium_category === "おもちゃ" || midium_category === "行事/記念品") && (type !== "---") && (type !== "靴下/スパッツ") && (type !== "エプロン") && (type !== "サスペンダー") && (type !== "タイツ") && (type !== "ハンカチ") && (type !== "バンダナ") && (type !== "ベルト") && (type !== "マフラー") && (type !== "傘") && (type !== "手袋") && (type !== "スタイ") && (type !== "バッグ")){
        midiums4.splice(i, 1);
      }
      else {
          ary.push(midiums4[i]);
        }
      }
      $('#item-main-state__box__category__select__name2').children().remove();
      $('#item-main-state__box__category__select__name2').prepend(ary);
      $('#item-main-state__box__category__select__name2').css('display', 'block').val("---");
  });
  
});
