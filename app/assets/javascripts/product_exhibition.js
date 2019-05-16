$(function(){

    function appendHtml(){
      var html = `<div class="item-main-state__box__category__select">
                    <select autofocus="autofocus" class="item-main-state__box__category__select__name">
                      <option value="---">---</option>
                      <option value="レディース">レディース</option>
                      <option value="メンズ">メンズ</option>
                    </select>`
      return html;
    }
  
  $('#first_category').change(function() {
      var html = $('option:selected').val();
      html = appendHtml();
      $('.item-main-state__box__first_category').append(html);
  })
  
  });