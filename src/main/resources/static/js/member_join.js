// 아이디 중복 체크
var check_id = false;
$('input[name="user_id"]').keyup(function() {
    var user_id = $('input[name="user_id"]').val();
    $.ajax({
        type: 'post',
        url: 'member_checkid.ajax',
        data: {
            "user_id": user_id
        },
        success: function(data) {
            if (user_id == ""){
                $('input[name="user_id"]').removeClass('pass');
                $('input[name="user_id"]').addClass('caution');
                $('.pass_id').addClass('hide');
                $('.check_id').addClass('hide');
                $('.npass_id').addClass('hide');
                $('.fill_id').removeClass('hide');
                check_id = false;
            } else if (user_id != "" && data.check_id) {
                $('input[name="user_id"]').removeClass('caution');
                $('input[name="user_id"]').addClass('pass');
                $('.pass_id').removeClass('hide');
                $('.check_id').addClass('hide');
                $('.npass_id').addClass('hide');
                $('.fill_id').addClass('hide');
                check_id = true;
            } else if (user_id != "" && !data.check_id) {
                $('input[name="user_id"]').removeClass('pass');
                $('input[name="user_id"]').addClass('caution');
                $('.pass_id').addClass('hide');
                $('.check_id').removeClass('hide');
                $('.npass_id').addClass('hide');
                $('.fill_id').addClass('hide');
                check_id = false;
            }
        },
        error: function(e) {}
    });
});

//





// 모달 변경
var alertCont = document.getElementsByClassName('modal_alert')[0],
    confirmCont = document.getElementsByClassName('modal_confirm')[0],
    msgstr = '',
    locationAddr = '';

const modal = {
    hide: function() {
        alertCont.style.display = 'none';
        confirmCont.style.display = 'none';
    },
    show: function(i) {
        document.getElementsByClassName('modal_body')[i].innerHTML = '<p>' + msgstr + '</p>';
        document.getElementsByClassName('backdrop')[i].addEventListener('click', modal.hide);
        document.getElementsByClassName('btn_close')[i].addEventListener('click', modal.hide);
        document.getElementsByClassName('btn_cancel')[i].addEventListener('click', modal.hide);
        document.getElementsByClassName('btn_confirm')[0].addEventListener('click', function() {
            location.href = locationAddr;
        });
    },
    showAlert: function(msg) {
        msgstr = msg;
        modal.show(0);
        alertCont.style.display = 'flex';
    },
    showConfirm: function(msg, loc) {
        msgstr = msg;
        locationAddr = loc;
        modal.show(1);
        confirmCont.style.display = 'flex';
    }
}