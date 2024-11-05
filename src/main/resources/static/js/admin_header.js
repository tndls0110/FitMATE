// leftnav에 회원 정보 그리기
$.ajax({
    type: 'post',
    url: 'admin_header.ajax',
    data: {},
    success: function(data) {
        if (data.name != null || data.name != "") {
            document.getElementsByClassName('admin_name')[0].innerHTML = data.name;
        }
    },
    error: function(e) {}
});