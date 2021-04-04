window.onload = function(){
  $('#kensaku').on('click', () => {      //$(#btn)でHTMLの検索ボタンのidの#btnを取得できる。「クリックされたら{}内の処理をする」という動きになる。
    $.ajax({
      url: "http://zipcloud.ibsnet.co.jp/api/search?zipcode=" + $('#postal-code').val(),  //リクエスト先のURLの末尾に、HTMLで入力された郵便番号を加える。postcodeは郵便番号のid
      dataType: 'jsonp',                                                               //なお$('#postcode').val()で郵便番号を取得している。 dataTypeにはレスポンスとして受け取るデータ形式を指定する。ここではjsonpを設定。
    }).done((data) => {
      if (data.results) {              //if (data.results)で「もし、dataに結果の情報(results)が入っていたら」という条件で分岐をする。
        getData(data.results[0]);      //入力した郵便番号が存在しない場合、後に記述するエラー内容（該当データが見つかりません）がアラートで出る。
      } else {
        alert('該当データが見つかりません');
      }
    }).fail((data) => {                //}).fail((data) => {では、何らかの原因で通信が失敗したときにアラートが出るように設定している。
      alert('通信に失敗しました');
    });
  });

  function getData(data) {            //getDataという関数を用意して、都道府県・市区町村・住所などの情報を使ってそれぞれのプロパティに代入する。
    $('#pref').val(data.address1);    //RubyみたいにgetDataが先に読まれるのではない
    $('#city').val(data.address2);
    $('#addresses').val(data.address3);
  }
};
