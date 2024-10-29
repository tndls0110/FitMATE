// 헬스 MBTI 결과 정보 관리
manageMBTIR();
function manageMBTIR() {
    let urlParams = new URLSearchParams(window.location.search);
    let mbtir_idx = urlParams.get('mbtir_idx');
    $('option[value="' + mbtir_idx + '"]').attr('selected', 'selected');
    for (let i = 0; i < document.getElementsByName('mbtir_idx').length; i++) {
        document.getElementsByName('mbtir_idx')[i].value = mbtir_idx;
    }
    document.getElementById('insert').action = 'admin_insertMbtir_detail.do?mbtir_idx='+mbtir_idx;
}

function onOptionChange(event){
    let mbtir_idx = event.target.value;
    location.href='admin_regMbtir_detail.go?mbtir_idx='+mbtir_idx;
}

// 정보 수정/삭제여부 입력
function regData(regType) {
    document.getElementsByName('reg_type')[0].value = regType;
    document.getElementsByTagName('form')[0].submit();
}



// 이미지 파일 입력시 미리보기 출력, 입력 개수 제한
function readFile(input){
    if (input.files.length > 1){
        modal.showAlert("이미지는 한 장만 입력할 수 있습니다.");
        input.value = '';
    } else if (input.files.length == 1) {
        $('.img_preview').empty().removeClass('hide');
        for (var file of input.files) {
            reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function(e) {
                $('.img_preview').append('<img src="'+e.target.result+'" alt="헬스 MBTI 이미지 미리보기" />');
            }
        }
    }
}