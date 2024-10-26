// leftnav에 회원 정보 그리기
$.ajax({
    type: 'post',
    url: 'admin_header.ajax',
    data: {},
    success: function(data) {
        drawProfile(data.name);
    },
    error: function(e) {}
});

function drawProfile(name) {
    var admin_name = document.getElementsByClassName('admin_name')[0];
    admin_name.innerHTML = name;
}