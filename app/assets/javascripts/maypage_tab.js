$(function() {
  $('.items-show--container--content__tab li').click(function() {
    var index = $('.items-show--container--content__tab li').index(this);
    $('.items-show--container--content__tab li').removeClass('active');
    $(this).addClass('active');
    $('.items-show--container--content__area ul').removeClass('show').eq(index).addClass('show');
  });
});
