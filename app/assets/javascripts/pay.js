document.addEventListener(
  "DOMContentLoaded", e => {
    $(function() {
      Payjp.setPublicKey("pk_test_32a8ad5981f1cff6c8ae1525");
      var form = $("#charge-form"),
          number = form.find('input[name="number"]'),
          cvc = form.find('input[name="cvc"]'),
          exp_month = form.find('select[name="exp_month"]'),
          exp_year = form.find('select[name="exp_year"]')

      form.on("click", "#token_submit", function(e) {
        e.preventDefault();
      
        form.find("input[type=submit]").prop("disabled", true);
    
        var card = {
          number: parseInt($('#card_number').val()),
          cvc: parseInt($('#cvc').val()),
          exp_month: parseInt($('#exp_month').val()),
          exp_year: parseInt($('#exp_year').val()),
        };
        console.log(card);
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { //成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
            
            form.append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            console.log("aaaxxx");
            document.charge-form.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    });
  },
  false
);

    // if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
    //   Payjp.setPublicKey("pk_test_32a8ad5981f1cff6c8ae1525"); //ここに公開鍵を直書き
    //   $('#token_submit').on("click", function(e){ //ボタンが押されたときに作動します
    //     e.preventDefault(); //ボタンを一旦無効化します
    //     // form.find("input[type=submit]").prop("disabled", true);

    //     var card = {
    //       number: parseInt($('#card_number').val()),
    //       cvc: parseInt($('#cvc').val()),
    //       exp_month: parseInt($('#exp_month').val()),
    //       exp_year: parseInt($('#exp_year').val()),
    //     }; //入力されたデータを取得します。
    //     console.log(card);
    //     Payjp.createToken(card, function(status, response) {
    //       if (stauts == 200) {
    //         console.log('success');
    //         $('#card_number').removeAttr("name");
    //         $('#cvc').removeAttr("name");
    //         $("#exp_month").removeAttr("name");
    //         $("#exp_year").removeAttr("name");
    //         var token = response.id;
    //         $("#card-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
    //         $("#card-form").get(0).submit();
    //       }
    //       else {
    //         alert("error")
    //         form.find('button').prop('disabled', false);
    //       }
    //     });
    //   });
    // }
