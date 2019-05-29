$(function(){

    function appendHTML() {
      var html = `<div class="item_main-image__bottom__right__box">
                    <label class="item_main-image__bottom__right__box__label">
                      <div class="item_main-image__bottom__right__box__label__content">
                        <p class="item_main-image__bottom__right__box__label__content--text">
                          ドラッグアンドドロップ
                        </p>
                        <p class="item_main-image__bottom__right__box__label__content--text">
                          またはクリックしてファイルをアップロード
                        </p>
                      </div>
                      <input multiple="multiple" class="item_main-image__bottom__right__file" type="file" name="item[images]" id="item_html">
                    </label>
                  </div>`
      return html;
    }

    function appendIMG(id_number2, id_number3) {
      var html2 = `<ul class="item-main-image__content__left__top">
                     <li class="item-main-image__content__left__top__li">
                       <figure class="item-main-image__content__left__top__li__figure" id="${id_number2}">
                       </figure>
                       <div class="item-main-image__content__left__top__li__button" id="${id_number3}">
                         <p href="#" class="item-main-image__content__left__top__li__button--edit">
                           編集
                         </p>
                         <p href="#" class="item-main-image__content__left__top__li__button--edit">
                           削除
                         </p>
                       </div>
                     </li>
                    </ul>`

      return html2;
                    
    }


    function appendDRAG(drag_number) {
      var html3 = `<ul class="item-main-image__content__left__top">
                     <li class="item-main-image__content__left__top__li">
                       <figure class="item-main-image__content__left__top__li__figure" id="${id_number2}">
                         <img id="${drag_number}" width="100%" height="80px">
                       </figure>
                       <div class="item-main-image__content__left__top__li__button" id="${id_number3}">
                         <p href="#" class="item-main-image__content__left__top__li__button--edit">
                           編集
                         </p>
                         <p href="#" class="item-main-image__content__left__top__li__button--edit">
                           削除
                         </p>
                       </div>
                     </li>
                    </ul>`

      return html3;
                    
    }

  
    // 上側の処理
      $('.item-main-image__content').on('change',function(e){
        var files = e.target.files;
        var d = (new $.Deferred()).resolve();
        $.each(files,function(i,file){
          d = d.then(function(){return previewImage(file)});
        });
      })
      var num = 0;
      var test = 600;
      var id_number = 0;
      var id_number2 = 100;
      var id_number3 = 1000;
      var previewImage = function(imageFile){
        var reader = new FileReader();
        var img = new Image();
        var def =$.Deferred();
        num = num + 1;
        id_number = id_number + 1;
        id_number2 = id_number2 + 1;
        id_number3 = id_number3 + 1;
        var tmp = $(img);
        tmp[0].setAttribute("id", id_number);
        reader.onload = function(e){
          if (num <= 4) {
            // console.log(num);
          test = test - 120;
          $('.item-main-image__content__left').css('display', 'block');
          $('.item-main-image__content__right').css('width', test + 'px');
          $(img).css('width', '100%').css('height', '80px').css('margin-right', '15px');
          var html2 = appendIMG(id_number2, id_number3);
          $('.item-main-image__content__left').append(html2);
          $(`#${id_number2}`).prepend(img);
        } else if (num === 5) {
          console.log(num);
          test = test - 120;
          $('.item-main-image__content__left').css('display', 'block');
          $('.item-main-image__content__right').css('width', test + 'px');
          $(img).css('width', '100%').css('height', '80px').css('margin-right', '15px');
          var html2 = appendIMG(id_number2, id_number3);
          $('.item-main-image__content__left').append(html2);
          $(`#${id_number2}`).prepend(img);
          var html = appendHTML();
          $('.item_main-image__bottom__right').prepend(html);
          $('.item-main-image__content__right__box').css('display', 'none');
        }
          img.src = e.target.result;
          def.resolve(img);
        };
        reader.readAsDataURL(imageFile);
        return def.promise();
      }


      // 下側の処理
      $('.item-main-image__bottom').on('change',function(e){
        var files = e.target.files;
        var d = (new $.Deferred()).resolve();
        $.each(files,function(i,file){
          d = d.then(function(){return previewImage2(file)});
        });
      })
      // var num = 0;
         var test_a = 600;
      // var id_number = 0;
      // var id_number2 = 100;
      // var id_number3 = 1000;
      var previewImage2 = function(imageFile){
        var reader = new FileReader();
        var img = new Image();
        var def =$.Deferred();
        num = num + 1;
        id_number = id_number + 1;
        id_number2 = id_number2 + 1;
        id_number3 = id_number3 + 1;
        var tmp = $(img);
        tmp[0].setAttribute("id", id_number);
        reader.onload = function(e){
          if (num <= 9) {
          test_a = test_a - 120;
          $('.item-main-image__bottom__left').css('display', 'block');
          $('.item_main-image__bottom__right').css('width', test_a + 'px');
          $(img).css('width', '100%').css('height', '80px').css('margin-right', '15px');
          var html2 = appendIMG(id_number2, id_number3);
          $('.item-main-image__bottom__left').append(html2);
          $(`#${id_number2}`).prepend(img);
        } else if(num === 10) {
          test_a = test_a - 120;
          $('.item-main-image__bottom__left').css('display', 'block');
          $('.item_main-image__bottom__right').css('width', test_a + 'px');
          $(img).css('width', '100%').css('height', '80px').css('margin-right', '15px');
          var html2 = appendIMG(id_number2, id_number3);
          $('.item-main-image__bottom__left').append(html2);
          $(`#${id_number2}`).prepend(img);
        //   var html = appendHTML();
        //   $('.item_main-image__bottom__right').prepend(html);
          $('.item_main-image__bottom__right__box').css('opacity', 0);
        }
          img.src = e.target.result;
          def.resolve(img);
        };
        reader.readAsDataURL(imageFile);
        return def.promise();
      }


    // 削除処理（出品時）
    $(document).on('click', '.item-main-image__content__left__top__li__button--edit', function(){
        var text = $(this).parent().attr("id");
        $(`#${text}`).parent().parent().remove();
        num = num - 1
        test = test + 120;
        test_a = test_a + 120;
        id_number = 0;
        id_number2 = 100;
        id_number3 = 1000;
        if ( num <= 3) {
            $('.item-main-image__content__right').css('width', test + 'px');
        }
        
        else if (num === 4) {
            $('.item_main-image__bottom__right__box').css('display', 'none');
            test = 120;
            $('.item-main-image__content__right__box').css('display', 'block');
            $('.item-main-image__content__right').css('width', test + 'px');
        } else if (num >= 5 && num <= 8) {
            $('.item_main-image__bottom__right').css('width', test_a + 'px');
        } else if (num === 9) {
            test_a = 120;
            $('.item_main-image__bottom__right__box').css('opacity', 1);
            $('.item_main-image__bottom__right').css('width', test_a + 'px');
        }

    })

    // 削除処理（編集時）
    $( '.item-main-image__content__left__top__li__button--delete').on('click', function(){
        console.log(num);
        var text = $(this).parent().attr("id");
        $(`#${text}`).parent().parent().remove();
        num = 0;
        id_number = 0;
        id_number2 = 100;
        id_number3 = 1000;
        $('.item-main-image__content__right').css('width', test + 'px');
    })

    // ドラッグ&ドロップ
    $(window).on('load',function(){
    var url = location.href;
    if (url === "http://localhost:3000/items/new" || url.match(/edit/)) {
    var drag_number = 0;
    var target = document.getElementById("aaa");
    target.addEventListener('dragover', function (e) {
        e.preventDefault();
        e.stopPropagation();
        e.dataTransfer.dropEffect = 'copy';
    });
    target.addEventListener('drop', function (e) {
      e.stopPropagation();
      e.preventDefault();
      const reader = new FileReader();
      num = num + 1;
      id_number = id_number + 1;
      id_number2 = id_number2 + 1;
      id_number3 = id_number3 + 1;
      drag_number = drag_number + 1;
      reader.onload = function (e) {
      if (num <= 4) {
        test = test - 120;
        $('.item-main-image__content__left').css('display', 'block');
        $('.item-main-image__content__right').css('width', test + 'px');
          var html3 = appendDRAG(drag_number);
          $('.item-main-image__content__left').append(html3);
          document.getElementById(drag_number).src = e.target.result;
      } else if (num === 5) {
            test = test - 120;
            $('.item-main-image__content__left').css('display', 'block');
            $('.item-main-image__content__right').css('width', test + 'px');
            var html3 = appendDRAG(drag_number);
            $('.item-main-image__content__left').append(html3);
            document.getElementById(drag_number).src = e.target.result;
            var html = appendHTML();
            $('.item_main-image__bottom__right').prepend(html);
            $('.item-main-image__content__right__box').css('display', 'none');
        }
      }
        reader.readAsDataURL(e.dataTransfer.files[0]);
    });
    }
  });

});
