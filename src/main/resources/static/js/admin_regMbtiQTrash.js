var urlParams = new URLSearchParams(window.location.search);
var mbtiq_idx = urlParams.get('mbtiq_idx');

manageMBTIRQ();

function manageMBTIRQ() {
    $('option[value="' + mbtiq_idx + '"]').attr('selected', 'selected');
}

function onOptionChange(event){
    location.href='admin_regMbtiq_subTrash.go?mbtiq_idx='+event.target.value;
}

function restoreRow(mbtisub_idx) {
    $.ajax({
        type: 'post',
        url: 'admin_regMbtiq_sub_restoreRow.ajax',
        data: {
            'mbtisub_idx': mbtisub_idx
        },
        success: function(data) {
            location.href='admin_regMbtiq_sub.go?mbtiq_idx='+mbtiq_idx;
        },
        error: function(e) {}
    });
}

function goBack() {
    location.href='admin_regMbtiq_sub.go?mbtiq_idx='+mbtiq_idx;
}