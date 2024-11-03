var urlParams = new URLSearchParams(window.location.search);
var mbtiq_idx = urlParams.get('mbtiq_idx');

manageMBTIRQ();

function manageMBTIRQ() {
    $('option[value="' + mbtiq_idx + '"]').attr('selected', 'selected');
}

function onOptionChange(event){
    location.href='admin_regMbtiq_sub.go?mbtiq_idx='+event.target.value;
}

function insertRow() {
    $.ajax({
        type: 'post',
        url: 'admin_regMbtiq_sub_insertRow.ajax',
        data: {
            'mbtiq_idx': mbtiq_idx
        },
        success: function(data) {
            location.href='admin_regMbtiq_sub.go?mbtiq_idx='+mbtiq_idx;
        },
        error: function(e) {}
    });
}

function updateQuestion(mbtisub_idx) {
    $.ajax({
        type: 'post',
        url: 'admin_regMbtiq_sub_updateQuestion.ajax',
        data: {
            'mbtiq_idx': mbtiq_idx,
            'mbtisub_idx': mbtisub_idx,
            'mbtisub_con': document.getElementsByName('mbtisub_idx_'+mbtisub_idx)[0].value
        },
        success: function(data) {
            location.href='admin_regMbtiq_sub.go?mbtiq_idx='+mbtiq_idx;
        },
        error: function(e) {}
    });
}

function updateScore(mbtiscr_idx) {
    $.ajax({
        type: 'post',
        url: 'admin_regMbtiq_sub_updateScore.ajax',
        data: {
            'mbtiscr_idx': mbtiscr_idx,
            'mbtiscr_scr': document.getElementsByName('mbtiscr_idx_'+mbtiscr_idx)[0].value
        },
        success: function(data) {
            location.href='admin_regMbtiq_sub.go?mbtiq_idx='+mbtiq_idx;
        },
        error: function(e) {}
    });
}

function deleteRow(mbtisub_idx) {
    $.ajax({
        type: 'post',
        url: 'admin_regMbtiq_sub_deleteRow.ajax',
        data: {
            'mbtisub_idx': mbtisub_idx
        },
        success: function(data) {
            location.href='admin_regMbtiq_sub.go?mbtiq_idx='+mbtiq_idx;
        },
        error: function(e) {}
    });
}

function deleteQuestion() {
    $.ajax({
        type: 'post',
        url: 'admin_regMbtiq_sub_deleteQuestion.ajax',
        data: {
            'mbtiq_idx': mbtiq_idx
        },
        success: function(data) {
            location.href='admin_regMbtiq_sub.go?mbtiq_idx=1';
        },
        error: function(e) {}
    });
}