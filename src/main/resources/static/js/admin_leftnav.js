// 사용중인 메뉴에 active 클래스 추가
addActive(index);

function addActive(index) {
    let i = index;
    if (i >= 0){
        $('.leftnav_list:nth-child('+i+')').addClass('active');
    }
}