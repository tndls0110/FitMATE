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

//비밀번호 및 비밀번호 확인값 동일 여부 확인
var check_pw = false;
$('input[name="pw"]').focusout(function() {
    var pw = $('input[name="pw"]').val();
    var pwconfirm = $('input[name="pwconfirm"]').val();
    if (pw != "" && pw == pwconfirm){
        $('input[name="pwconfirm"]').removeClass('caution');
        $('.check_pw').addClass('hide');
        check_pw = true;
    } else if (pw != "" && pw != pwconfirm){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.check_pw').removeClass('hide');
        $('.fill_pw').addClass('hide');
        check_pw = false;
    } else if (pw == ""){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.check_pw').addClass('hide');
        $('.fill_pw').removeClass('hide');
        check_pw = false;
    }
});
$('input[name="pwconfirm"]').focusout(function() {
    var pw = $('input[name="pw"]').val();
    var pwconfirm = $('input[name="pwconfirm"]').val();
    if (pw != "" && pw == pwconfirm){
        $('input[name="pwconfirm"]').removeClass('caution');
        $('.check_pw').addClass('hide');
        check_pw = true;
    } else if (pw != "" && pw != pwconfirm){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.check_pw').removeClass('hide');
        $('.fill_pw').addClass('hide');
        check_pw = false;
    } else if (pw == ""){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.check_pw').addClass('hide');
        $('.fill_pw').removeClass('hide');
        check_pw = false;
    }
});

// 닉네임 중복 체크
var check_nick = false;
$('input[name="nick"]').keyup(function() {
    var nick = $('input[name="nick"]').val();
    $.ajax({
        type: 'post',
        url: 'member_checknick.ajax',
        data: {
            "nick": nick
        },
        success: function(data) {
            if (nick == ""){
                $('input[name="nick"]').removeClass('pass');
                $('input[name="nick"]').addClass('caution');
                $('.pass_nick').addClass('hide');
                $('.check_nick').addClass('hide');
                $('.npass_nick').addClass('hide');
                $('.fill_nick').removeClass('hide');
                check_nick = false;
            } else if (nick != "" && data.check_nick) {
                $('input[name="nick"]').removeClass('caution');
                $('input[name="nick"]').addClass('pass');
                $('.pass_nick').removeClass('hide');
                $('.check_nick').addClass('hide');
                $('.npass_nick').addClass('hide');
                $('.fill_nick').addClass('hide');
                check_nick = true;
            } else if (nick != "" && !data.check_nick) {
                $('input[name="nick"]').removeClass('pass');
                $('input[name="nick"]').addClass('caution');
                $('.pass_nick').addClass('hide');
                $('.check_nick').removeClass('hide');
                $('.npass_nick').addClass('hide');
                $('.fill_nick').addClass('hide');
                check_nick = false;
            }
        },
        error: function(e) {}
    });
});

// 프로필 입력시 미리보기 출력
function readFile(input){
    var reader = new FileReader();
    reader.readAsDataURL(input.files[0]);
    reader.onload = function(e) {
        $('.img_preview').html('<img class="preview" src="'+e.target.result+'" />');
    }
}

// 지역 출력
function onOptionChange(event){
    var region_idx = event.target.value;
    $.ajax({
        type: 'post',
        url: 'member_callregion.ajax',
        data: {
            "region_idx": region_idx
        },
        success: function(data) {
            drawRegion(data.list)
        },
        error: function(e) {}
    });
}

function drawRegion(list) {
    $('select[name="region2"]').empty();
    var tags = '';
    for (var item of list){
        tags += '<option value="'+item.regions_idx+'">'+item.regions_name+'</option>';
    }
    $('select[name="region2"]').append(tags);
}

function update() {
    var user_id = $('input[name="user_id"]').val();
    var pw = $('input[name="pw"]').val();
    var nick = $('input[name="nick"]').val();
    var name = $('input[name="name"]').val();
    var email = $('input[name="email"]').val();
    var birthday = $('input[name="birthday"]').val();
    var check_null = false;
    $('input').removeClass('pass');
    $('input').removeClass('caution');
    $('.msg').addClass('hide');
    if (user_id != '' && pw != '' && nick != '' && name != '' && email != '' && birthday != ''){
        check_null = true;
    }
    if (!check_null){
        modal.showAlert('필수 항목을 모두 입력하세요.');
        showNull(user_id, pw, nick, name, email, birthday);
    } else if (!check_id){
        modal.showAlert('아이디 중복 여부를 확인하세요.');
        showNull(user_id, pw, nick, name, email, birthday);
    } else if (!check_nick){
        modal.showAlert('닉네임 중복 여부를 확인하세요.');
        showNull(user_id, pw, nick, name, email, birthday);
    } else if (!check_pw){
        modal.showAlert('비밀번호와 비밀번호 확인값은 동일해야 합니다.');
        showNull(user_id, pw, nick, name, email, birthday);
    } else {
        $('form').submit();
    }
}

function showNull(user_id, pw, nick, name, email, birthday) {
    if (user_id == ''){
        $('input[name="user_id"]').addClass('caution');
        $('.fill_id').removeClass('hide');
    } else if (!check_id){
        $('input[name="user_id"]').addClass('caution');
        $('.npass_id').removeClass('hide');
    }
    if (pw == ''){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.fill_pw').removeClass('hide');
    } else if (!check_pw){
        $('input[name="pwconfirm"]').addClass('caution');
        $('.check_pw').removeClass('hide');
    }
    if (nick == ''){
        $('input[name="nick"]').addClass('caution');
        $('.fill_nick').removeClass('hide');
    } else if (!check_nick){
        $('input[name="nick"]').addClass('caution');
        $('.npass_nick').removeClass('hide');
    }
    if (name == ''){
        $('input[name="name"]').addClass('caution');
        $('.fill_name').removeClass('hide');
    }
    if (email == ''){
        $('input[name="email"]').addClass('caution');
        $('.fill_email').removeClass('hide');
    }
    if (birthday == ''){
        $('input[name="birthday"]').addClass('caution');
        $('.fill_birth').removeClass('hide');
    }
}