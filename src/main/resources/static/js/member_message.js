var urlParams = new URLSearchParams(window.location.search);
var group_idx = urlParams.get('group_idx');

let refreshInterval = setInterval(showList, 100);

function showList() {
    $.ajax({
        type: 'get',
        url: 'member_message.ajax',
        data: {
            'groupIdx': group_idx
        },
        dataType: 'json',
        success: function(data) {
            if (data.roomList.length > 0) {
                printList(data.roomList);
                printMessage(data.messageList);
            }
        },
        error: function(e) {}
    });
}

function printList(list) {
    let tags = '';
    for (let i = 0; i < list.length; i++) {
        tags += '<ul class="noDesc">';
        tags += '<li><a href="member_message.go?group_idx='+list[i].group_idx+'">';
        if (user == list[i].member1){
            tags += list[i].member2;
        } else {
            tags += list[i].member1;
        }
        tags += '</a></li>';
        tags += '</ul>';
    }
    document.getElementsByClassName('message_list')[0].innerHTML = tags;
}

function printMessage(list) {
    let tags = '';
    for (let i = 0; i < list.length; i++) {
        tags += '<ul class="noDesc">';
        tags += '<li>'+list[i].sender_id+' / '+list[i].msg_cont+' / '+list[i].sendtime+'</li>';
        tags += '</ul>';
    }
    document.getElementsByClassName('message_contents')[0].innerHTML = tags;
}