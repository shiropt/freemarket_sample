//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load',function(){
  // pay.jpと通信する為、公開鍵をセット
  Payjp.setPublicKey('pk_test_fa06ca128d1486d7d29ad0c4');
  // submitボタンをクリックで発火
   $("#charge-form").click(function() {
    let form = $(".card-form");
     // フォームの処理を一旦停止
    form.find("input[type=submit]").prop("disabled", true);
    // pay.jpへ送るカードデータをcardへ代入
    let card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };
    // cardに代入されたデータをpay.jpへ登録する為トークンとして保存
     Payjp.createToken(card, function(status, response) {
      // エラーの場合は処理せず戻る
      if (response.error){
        form.find('.payment-errors').text(response.error.message);
        //submitボタンの有効化
        form.find('button').prop('disabled', false);
      }
      // エラーのない場合はフォームで入力されたデータを削除(セキュリティ上アプリ側にデータを残したくないため)
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        var token = response.id;
        // フォームの処理を再開する
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      };
    });
  });
});