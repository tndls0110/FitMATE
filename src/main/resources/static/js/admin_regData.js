// 수정
function updateData(elem, idx) {
    var contents = elem.value;
    modal.showConfirm(elem.value+" 항목으로 수정하시겠습니까?", "admin_updateReport.do");
}

// 삭제
function deleteData(elem, idx) {
    modal.showConfirm(elem.value+" 항목을 삭제하시겠습니까?", "admin_deleteReport.do");
}

// 작성
function insertData(){
    var elem = document.getElementsByClassName('insertData')[0];
    modal.showConfirm(elem.value+" 항목을 작성하시겠습니까?", "admin_insertReport.do");
}