// 신고 목록 출력
let showPage = 1;
let cnt = 10;
let vPages = 10;

const searchParams = new URLSearchParams(window.location.search);
let searchType = searchParams.get('searchType');
let keywords = searchParams.get('keywords');

pageShow(showPage);

function pageShow(page) {
    $.ajax({
        type: 'post',
        url: 'report_list.ajax',
        data: {
            'page': page,
            'cnt': cnt,
            'opt': searchType,
            'keyword': keywords
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
    let tags = '';
    for (let i = 0; i < list.length; i++) {
        tags += '<tr>';
        tags += '<td>'+(totalIdx - ( (currentPage - 1) * cnt) - i)+'</td>';
        tags += '<td class="left">'+list[i].내용+'</td>';
        tags += '<td>'+list[i].신고유형+'</td>';
        tags += '<td>'+list[i].신고자+'</td>';
        tags += '<td>'+list[i].작성자+'</td>';
        tags += '<td>'+list[i].신고일시+'</td>';
        if (list[i].상태 == 1){
            tags += '<td><button class="mainbtn minbtn">게시중</button></td>';
        } else {
            tags += '<td><button class="subbtn minbtn">게시안함</button></td>';
        }
        tags += '</tr>';
    }
    document.getElementsByTagName('tbody')[0].innerHTML = tags;
}