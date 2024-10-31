// 신고 처리
function confirmReport() {
    if (document.getElementsByName('report_prog')[0].value == 0){
        modal.showAlert("처리 진행 과정을 선택하세요.");
    } else {
        document.getElementsByTagName('form')[0].submit();
    }
}