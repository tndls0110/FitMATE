showSendButton(loginId, receiver);

function showSendButton(loginId, receiver) {
    if (loginId == receiver){
        document.getElementsByClassName('sendMessageBtn')[0].style.display = 'none';
    }
}

function findMessageGroup(userId){
    $.ajax({
        type: 'post',
        url: 'member_findMessageGroup.ajax',
        data: {
            'member2': userId
        },
        dataType: 'json',
        success: function(data) {
            console.log(data.messageGroup);
            location.href = 'member_messageList.go?group_idx='+data.messageGroup;
        },
        error: function(e) {}
    });
}