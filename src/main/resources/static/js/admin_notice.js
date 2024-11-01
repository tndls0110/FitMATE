// 공지사항 출력
let showPage = 1;
let cnt = 13;
let vPages = 10;

const searchParams = new URLSearchParams(window.location.search);
let searchType = searchParams.get('searchType');
let keywords = searchParams.get('keywords');

pageShow(showPage);

function pageShow(page) {
    $.ajax({
        type: 'post',
        url: 'notice_list.ajax',
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
            document.getElementsByClassName('first')[0].children[0].innerHTML = '<i class="bi bi-chevron-bar-left"></i>';
            document.getElementsByClassName('prev')[0].children[0].innerHTML = '<i class="bi bi-chevron-left"></i>';
            document.getElementsByClassName('next')[0].children[0].innerHTML = '<i class="bi bi-chevron-right"></i>';
            document.getElementsByClassName('last')[0].children[0].innerHTML = '<i class="bi bi-chevron-bar-right"></i>';
        },
        error: function(e) {}
    });
}

function listPrint(list, totalIdx, currentPage, offset) {
    let tags = '';

    for (let i = 0; i < list.length; i++) {
        tags += '<tr>';
        tags += '<td>'+(totalIdx - ( (currentPage - 1) * cnt) - i)+'</td>';
        tags += '<td class="left">'+list[i].notice_cont+'</td>';
        tags += '<td>'+list[i].admin_name+'</td>';
        tags += '<td>'+list[i].notice_regdate+'</td>';
        if (list[i].notice_show == 1){
            tags += '<td><button class="mainbtn minbtn">게시중</button></td>';
        } else {
            tags += '<td><button class="subbtn minbtn">게시안함</button></td>';
        }
        if (list[i].notice_show == 1){
            tags += '<td><button onclick="invisible('+list[i].notice_idx+')" class="textbtn minbtn">게시중단</button></td>';
        } else {
            tags += '<td></td>';
        }
        tags += '</tr>';
    }
    document.getElementsByTagName('tbody')[0].innerHTML = tags;
}

function invisible(idx) {
    showPage = document.getElementsByClassName('active')[1].children[0].innerHTML;
    $.ajax({
        type: 'post',
        url: 'notice_invisible.ajax',
        data: {
            'notice_idx': idx
        },
        dataType: 'json',
        success: function(data) {
            if (data.success){
                $('#pagination').twbsPagination('destroy');
                pageShow(showPage);
            }
        },
        error: function(e) {}
    });
}

// 공지사항 작성
function writeNotice() {
    let leng = document.getElementsByTagName('textarea')[0].value.length;
    if (leng == 0){
        modal.showAlert("내용을 입력하세요.");
    } else {
        document.getElementsByTagName('form')[0].submit();
    }
}