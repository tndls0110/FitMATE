// 기존 비밀번호 체크
var check_prepw = false;
$('input[name="oldpw"]').blur(function() {
    var old_pw = $('input[name="oldpw"]').val();
    $.ajax({
        type: 'post',
        url: 'member_checkpw.ajax',
        data: {
            "old_pw": old_pw
        },
        success: function(data) {
            // 기존 비밀번호 항목을 통과했을 경우
            if (data.check_pw) {
                $('input[name="oldpw"]').removeClass('caution');
                $('input[name="oldpw"]').addClass('pass');
                $('.msg_oldpw').removeClass('hide').removeClass('caution').addClass('pass').html('기존 비밀번호를 확인했습니다. 새 비밀번호를 설정하세요.');
                check_prepw = true;

                // 기존 비밀번호 항목을 통과하지 못했을 경우
            } else {
                $('input[name="oldpw"]').removeClass('pass');
                $('input[name="oldpw"]').addClass('caution');
                $('.msg_oldpw').removeClass('hide').removeClass('pass').addClass('caution').html('기존 비밀번호를 확인하세요.');
                check_id = false;
            }
        },
        error: function(e) {}
    });
});

//비밀번호 및 비밀번호 확인값 동일 여부 확인
var check_pw = false;
$('input[name="pw"]').keyup(function() {
    checkDupl();
});

$('input[name="pwconfirm"]').keyup(function() {
    checkDupl();
});

function checkDupl() {
    var old_pw = $('input[name="oldpw"]').val();
    var pw = $('input[name="pw"]').val();
    var pwconfirm = $('input[name="pwconfirm"]').val();
    if (pw != "" && pw != pwconfirm){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.msg_pw').removeClass('hide').removeClass('pass').addClass('caution').html('새 비밀번호와 새 비밀번호 확인 값은 동일해야 합니다.');
        check_pw = false;
    } else if(pw != "" && old_pw == pw) {
        $('input[name="pwconfirm"]').removeClass('pass');
        $('input[name="pwconfirm"]').addClass('caution');
        $('.msg_pw').removeClass('hide').removeClass('pass').addClass('caution').html('새 비밀번호는 기존 비밀번호와 달라야 합니다.');
        check_prepw = false;
    } else if (pw == ""){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.msg_pw').removeClass('hide').removeClass('pass').addClass('caution').html('새 비밀번호를 입력하세요.');
        check_pw = false;
    } else if (pw != "" && pw == pwconfirm){
        $('input[name="pwconfirm"]').removeClass('caution');
        $('.msg_pw').removeClass('hide').removeClass('caution').addClass('pass').html('사용할 수 있는 비밀번호입니다.');
        check_pw = true;
    }
}

function updatepw() {
    var oldpw = $('input[name="oldpw"]').val();
    var pw = $('input[name="pw"]').val();
    var pwconfirm = $('input[name="pwconfirm"]').val();
    var check_null = false;
    $('input').removeClass('pass');
    $('input').removeClass('caution');
    $('.msg').addClass('hide').removeClass('pass').removeClass('caution');
    if (oldpw != '' && pw != '' && pwconfirm != ''){
        check_null = true;
    }
    if (!check_null){
        modal.showAlert('필수 항목을 모두 입력하세요.');
        showNull(oldpw, pw, pwconfirm);
    } else if (!check_pw){
        modal.showAlert('새 비밀번호와 새 비밀번호 확인값은 동일해야 합니다.');
        showNull(oldpw, pw, pwconfirm);
    } else {
        $('form').submit();
    }
}

function showNull(oldpw, pw, pwconfirm) {
    if (oldpw == ''){
        $('input[name="oldpw"]').addClass('caution');
        $('.msg_oldpw').removeClass('hide').addClass('caution').html('기존 비밀번호를 입력하세요.');
    } else if (!check_pw){
        $('input[name="user_id"]').addClass('caution');
        $('.msg_oldpw').removeClass('hide').addClass('caution').html('기존 비밀번호를 확인하세요.');
    }
    if (pw == ''){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.msg_pw').removeClass('hide').addClass('caution').html('새 비밀번호를 입력하세요.');
    } else if (pwconfirm == ''){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.msg_pw').removeClass('hide').addClass('caution').html('새 비밀번호 확인란에 입력하세요.');
    } else if (!check_pw){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.msg_pw').removeClass('hide').addClass('caution').html('새 비밀번호와 새 비밀번호 확인 값은 동일해야 합니다.');
    }
}