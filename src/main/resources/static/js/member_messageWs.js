var urlParams = new URLSearchParams(window.location.search);
var group_idx = urlParams.get('group_idx');

const socket = new WebSocket('ws://192.168.70.121/Fitmate_war/ws');
socket.onopen = function () {
    console.log('Connection opened');
}
socket.onmessage = function (event) {            const message = JSON.parse(event.data);
    const chat = document.getElementsByClassName('message_contents')[0];
    const messageElement = document.getElementsByClassName('message_lists')[0];
    messageElement.textContent = `${message.sender}: ${message.content}`;
    chat.appendChild(messageElement);
    chat.scrollTop = chat.scrollHeight;
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
    tags += '<ul class="noDesc">';
    for (let i = 0; i < list.length; i++) {
        tags += '<li>';
        if (group_idx == list[i].group_idx){
            tags += '<button onclick="location.href=\'member_messageList.go?group_idx='+list[i].group_idx+'\'" class="subbtn full">';
        } else {
            tags += '<button onclick="location.href=\'member_messageList.go?group_idx='+list[i].group_idx+'\'" class="textbtn full">';
        }
        if (user == list[i].member1){
            tags += list[i].member2+' ('+list[i].member2_nick+')';
        } else {
            tags += list[i].member1+' ('+list[i].member1_nick+')';
        }
        tags += '</button></li>';
    }
    tags += '</ul>';
    document.getElementsByClassName('message_list')[0].innerHTML = tags;
}

setGroup();

function setGroup() {
    if (group_idx == null || group_idx == 'null') {
        document.getElementsByClassName('waitingContainer')[0].style.display = 'none';
    } else {
        document.getElementsByClassName('selectContainer')[0].style.display = 'none';
        document.getElementsByName('group_idx')[0].value = group_idx;
        showMessage();
    }
}

let waitingInterval = setInterval(waitingAnimator, 150);

function waitingAnimator() {
    let waiting = document.getElementsByClassName('waiting')[0];
    if (waiting.innerHTML == '<i class="bi bi-reception-0"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-1"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-1"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-2"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-2"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-3"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-3"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-4"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-4"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-0"></i>';
    }
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
            clearInterval(waitingInterval);
            document.getElementsByClassName('waitingContainer')[0].style.display = 'none';
        },
        error: function(e) {}
    });
    const content = document.getElementsByClassName('message_contents')[0];
    content.scrollTop = content.scrollHeight;
}

function printMessage(list) {
    let tags = '';
    tags += '<ul class="noDesc message_lists">';
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