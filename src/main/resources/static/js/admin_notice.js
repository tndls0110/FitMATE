var showPage = 1;
var cnt = $('#pagePerNum').val();
var vPages = 8;

const searchParams = new URLSearchParams(window.location.search);
var opt = searchParams.get('opt');
var keyword = searchParams.get('keyword');

pageShow(showPage);
console.log(cnt)

$('#pagePerNum').change(function() {
    $('#pagination').twbsPagination('destroy');
    cnt = $('#pagePerNum').val();
    pageShow(showPage);
});

function pageShow(page) {
    $.ajax({
        type: 'post',
        url: 'notice_list.ajax',
        data: {
            'page': page,
            'cnt': cnt,
            'opt': opt,
            'keyword': keyword
        },
        dataType: 'json',
        success: function(data) {
            listPrint(data.list, data.totalIdx, data.currentPage, data.offset);

            $('#pagination').twbsPagination({
                startPage: data.page,
                totalPages: data.totalPages,
                visiblePages: vPages,
                onPageClick: function(evt, page) {
                    pageShow(page);
                }
            });

            $('.page-item.first a').html('<i class="bi bi-chevron-bar-left"></i>');
            $('.page-item.prev a').html('<i class="bi bi-chevron-left"></i>');
            $('.page-item.next a').html('<i class="bi bi-chevron-right"></i>');
            $('.page-item.last a').html('<i class="bi bi-chevron-bar-right"></i>');
        },
        error: function(e) {}
    });
}

function listPrint(list, totalIdx, currentPage, offset) {
    var tags = '';

    for (var i = 0; i < list.length; i++) {
        tags += '<tr>';
        tags += '<td>'+(totalIdx - ( (currentPage - 1) * cnt) - i)+'</td>';
        tags += '<td>'+list[i].notice_cont+'</td>';
        tags += '<td>'+list[i].admin_name+'</td>';
        tags += '<td>'+list[i].notice_regdate+'</td>';
        if (list[i].notice_show == 1){
            tags += '<td><button class="mainbtn minbtn">게시중</button></td>';
        } else {
            tags += '<td><button class="subbtn minbtn">게시안함</button></td>';
        }
        if (list[i].notice_show == 1){
            tags += '<td><button class="textbtn minbtn">게시중단</button></td>';
        }
        tags += '</tr>';
    }
    console.log(tags);
    document.getElementsByTagName('tbody')[0].innerHTML = tags;
}

function writeNotice() {
    var leng = document.getElementsByTagName('textarea')[0].value.length;
    if (leng == 0){
        modal.showAlert("내용을 입력하세요.");
    } else {
        document.getElementsByTagName('form')[0].submit();
    }
}