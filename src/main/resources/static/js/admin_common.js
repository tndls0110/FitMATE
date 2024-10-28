// 모달
var alertCont = document.getElementsByClassName('modal_alert')[0],
    confirmCont = document.getElementsByClassName('modal_confirm')[0],
    msgstr = '',
    locationAddr = '',
    eventfx;

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

// textarea에 작성시 글자수 출력
function drawLength(elem) {
    document.getElementsByClassName('counter')[0].innerHTML = elem.value.length;
    if (elem.value.length >= $(elem).attr('maxlength')){
        $(elem).addClass('caution');
        modal.showAlert("최대 1,000자까지 입력할 수 있습니다.");
    }
}