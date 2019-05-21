document.addEventListener(
  "DOMContentLoaded", e => {
    $(function() {
      Payjp.setPublicKey("pk_test_32a8ad5981f1cff6c8ae1525");
      var form = $("#charge-form"),
          number = form.find('input[name="number"]'),
          cvc = form.find('input[name="cvc"]'),
          exp_month = form.find('select[name="exp_month"]'),
          exp_year = form.find('select[name="exp_year"]')

      form.on("click", '#token_submit', function(e) {
        e.preventDefault();
      
        form.find("input[type=submit]").prop("disabled", true);
    
        var card = {
          number: parseInt($('#card_number').val()),
          cvc: parseInt($('#cvc').val()),
          exp_month: parseInt($('#exp_month').val()),
          exp_year: parseInt($('#exp_year').val()),
        };
        form[0].reset()
        $("#token_submit").disabled = "disabled";
        $("#token_submit").css("background", "gray")
        $("#token_submit").css("border", "1px solid gray")

        Payjp.createToken(card, (status, response) => {
          if (status === 200) { //成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除

            form.append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            form.submit();

            function sleep(waitMsec) {
              var startMsec = new Date();
              // 指定ミリ秒間だけループさせる
              while (new Date() - startMsec < waitMsec);
            }
            sleep(1000);
            window.location.href = '/cards'
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    });
  },
  false
);

$(function(){
  $('#buy-form-btn').on('click', function(){
    function sleep(waitMsec) {
      var startMsec = new Date();
      // 指定ミリ秒間だけループさせる
      while (new Date() - startMsec < waitMsec);
    }
    sleep(1000);
    window.location.href = '/items'
  });
});

