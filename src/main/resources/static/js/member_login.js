// var state = '${state}';
if (state == 'invalidID'){
    $('input[name="user_id"]').addClass('caution');
    $('input[name="admin_id"]').addClass('caution');
    $('.checkid').removeClass('hide');
} else if (state == 'invalidPW'){
    $('input[name="pw"]').addClass('caution');
    $('.checkpw').removeClass('hide');
}

// var msg = '${msg}';
if (msg != ''){
    modal.showAlert(msg);
}