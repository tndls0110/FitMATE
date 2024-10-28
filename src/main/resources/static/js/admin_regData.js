function regData(regType, idx) {
    for (let i = 0; i < document.getElementsByName('reg_type').length; i++) {
        document.getElementsByName('reg_type')[i].value = regType;
    }
    document.getElementById(idx).submit();
}

// 지역 정보 관리
manageRegion();

function manageRegion() {
    var urlParams = new URLSearchParams(window.location.search);
    var region_idx = urlParams.get('region_idx');
    $('option[value="' + region_idx + '"]').attr('selected', 'selected');
    $('option[name="region_idx"]').val(region_idx);
    console.log($('option[name="region_idx"]').val());
}

function onOptionChange(event){
    var region_idx = event.target.value;
    location.href='admin_regRegion_sub.go?region_idx='+region_idx;
}