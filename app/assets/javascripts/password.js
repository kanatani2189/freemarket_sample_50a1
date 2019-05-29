$(function() {
    $('#password').keypress(function(){
        if ( $(this).prop('checked') ) {
            $('#password').attr('type','text');
        } else {
            $('#password').attr('type','password');
        }
    });

    $('#password_confirmation').keypress(function(){
        if ( $(this).prop('checked') ) {
            $('#password_confirmation').attr('type','text');
        } else {
            $('#password_confirmation').attr('type','password');
        }
    });

    $('#password_login').keypress(function(){
        if ( $(this).prop('checked') ) {
            $('#password_login').attr('type','text');
        } else {
            $('#password_login').attr('type','password');
        }
    });
});