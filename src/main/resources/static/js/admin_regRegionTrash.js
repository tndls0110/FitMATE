// 지역 정보 관리
manageRegion();

function manageRegion() {
    var urlParams = new URLSearchParams(window.location.search);
    var region_idx = urlParams.get('region_idx');
    $('option[value="' + region_idx + '"]').attr('selected', 'selected');
    for (let i = 0; i < document.getElementsByName('region_idx').length; i++) {
        document.getElementsByName('region_idx')[i].value = region_idx;
    }
    document.getElementsByClassName('goBack')[0].onclick = function (){
        location.href = 'admin_regRegion_sub.go?region_idx='+region_idx;
    };
}

function onOptionChange(event){
    var region_idx = event.target.value;
    location.href='admin_regRegion_subTrash.go?region_idx='+region_idx;
}