// leftnav에 회원 정보 그리기
$.ajax({
    type: 'post',
    url: 'member_leftnav.ajax',
    data: {},
    success: function(data) {
        drawProfile(data.leftnav_prof);
    },
    error: function(e) {}
});

function drawProfile(list) {
    var profile = document.getElementsByClassName('leftnav_profImg')[0];
    var nick = document.getElementsByClassName('leftnav_nick')[0];
    if (list.profile != ''){
        profile.innerHTML = `<div style="background-image: url('/photo/${list.profile}');"></div>`;
    } else {
        profile.innerHTML = '<i class="bi bi-person-circle"></i>';
    }
    nick.innerHTML = '<b>'+list.nick+'</b> 님';
}