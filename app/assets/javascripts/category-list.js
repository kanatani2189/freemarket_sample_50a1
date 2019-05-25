//地域セレクトボックスイベント設定
setHierarchySelectEvent('category1', 'category2');
setHierarchySelectEvent('category2', 'category3');
//セレクトボックスの初期値
$('category1').val('1').change();
$('category2').val('2').change();
$('category3').val('2').change();

/**
 * 階層のあるプルダウンのイベントを設定します.
 * 親のselectタグには属性data-subgroupが設定されている必要があります。
 * 子のselectタグには属性data-groupが設定されている必要があります。
 * @param parentSelect 親となるselectタグのセレクタ
 * @param childSelect 子となるselectタグのセレクタ
 */
function setHierarchySelectEvent(parentSelect, childSelect){
    var initCategorySmallHtml = $(childSelect).html();
    $(parentSelect).hover(function(){
      console.log("成功")
        if( 1 < $(this).hover('li:selected').length ){
            $(childSelect).hover("li").each(function(index, element){
                $(element).remove();
            });
        }else{
            var subgroup =  $(this).find('li:selected').attr('subgroup');
            $(childSelect).html(initCategorySmallHtml);
            $(childSelect).hover("li").each(function(index, element){
                var group = $(element).attr('group');
                if( group ){
                    if( subgroup == group ){
                        //$(element).css('display', 'block');//IEではoptionタグに対してdisplayは効かないため
                    }else{
                        //$(element).css('display', 'none');//IEではoptionタグに対してdisplayは効かないため
                        $(element).remove();
                    }
                }
            });
        }
        $(childSelect).val('').change();//未選択時の値は''じゃない場合は書き換えてね
    });
}

