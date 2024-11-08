var urlParams = new URLSearchParams(window.location.search);
var group_idx = urlParams.get('group_idx');

if (group_idx != null || group_idx != '') {
    document.getElementsByName('group_idx')[0].value = group_idx;
    let MessageInterval = setInterval(showMessage, 500);
}

showList();

function showList() {
    $.ajax({
        type: 'post',
        url: 'member_messageGroup.ajax',
        data: {},
        dataType: 'json',
        success: function(data) {
            if (data.roomList.length > 0) {
                printList(data.roomList);
            }
        },
        error: function(e) {}
    });
}

function printList(list) {
    let tags = '';
    for (let i = 0; i < list.length; i++) {
        tags += '<ul class="noDesc">';
        tags += '<li>';
        if (group_idx == list[i].group_idx){
            tags += '<button onclick="location.href=\'member_messageList.go?group_idx='+list[i].group_idx+'\'" class="subbtn full">';
        } else {
            tags += '<button onclick="location.href=\'member_messageList.go?group_idx='+list[i].group_idx+'\'" class="textbtn full">';
        }
        if (user == list[i].member1){
            tags += list[i].member2;
        } else {
            tags += list[i].member1;
        }
        tags += '</button></li>';
        tags += '</ul>';
    }
    document.getElementsByClassName('message_list')[0].innerHTML = tags;
}

function showMessage() {
    $.ajax({
        type: 'post',
        url: 'member_messageList.ajax',
        data: {
            'group_idx': group_idx
        },
        dataType: 'json',
        success: function(data) {
            if (data.messageList.length > 0) {
                printMessage(data.messageList);
            }
        },
        error: function(e) {}
    });
    const content = document.getElementsByClassName('message_contents')[0];
    content.scrollTop = content.scrollHeight;
}

function printMessage(list) {
    let tags = '';
    tags += '<ul class="noDesc">';
    for (let i = 0; i < list.length; i++) {
        tags += '<li>';
        if (list[i].sender_id == user){
            tags += '<div class="msg_right">'+list[i].msg_cont+'</div>';
            tags += '<p class="time_right">'+list[i].sendtime+'</p>';
        } else {
            tags += '<div class="msg_left">'+list[i].msg_cont+'</div>';
            tags += '<p class="time_left">'+list[i].sendtime+'</p>';
        }
        tags += '</li>';
    }
    tags += '</ul>';
    document.getElementsByClassName('message_contents')[0].innerHTML = tags;
}

function pressEnter(event) {
    if (event.key === 'Enter') {
        sendMessage();
    }
}

function sendMessage() {
    let msgCont = document.getElementsByName('msg_cont')[0].value;
    if (msgCont == '' || msgCont == null){
        modal.showAlert('메시지를 입력하세요.')
    } else {
        $.ajax({
            type: 'post',
            url: 'member_sendMessage.ajax',
            data: {
                'group_idx': group_idx,
                'msg_cont': msgCont
            },
            dataType: 'json',
            success: function(data) {
                document.getElementsByName('msg_cont')[0].value = '';
            },
            error: function(e) {}
        });
    }
}