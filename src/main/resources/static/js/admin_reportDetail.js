// 신고 처리
function confirmReport() {
    let reportd_prog = document.getElementsByTagName('reportd_prog')[0].value;
    if (reportd_prog == 0){
        modal.showAlert("처리 진행 과정을 선택하세요.");
    } else {
        document.getElementsByTagName('form')[0].submit();
    }
}