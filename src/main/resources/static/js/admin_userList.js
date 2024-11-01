// 사용자 목록 출력
let showPage = 1;
let cnt = 15;
let vPages = 10;

const searchParams = new URLSearchParams(window.location.search);
let searchType = searchParams.get('searchType');
let keywords = searchParams.get('keywords');

pageShow(showPage);

function pageShow(page) {
    $.ajax({
        type: 'post',
        url: 'user_list.ajax',
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

    for (var i = 0; i < list.length; i++) {
        tags += '<tr>';
        tags += '<td>'+(totalIdx - ( (currentPage - 1) * cnt) - i)+'</td>';
        tags += '<td class="left">';
        tags += '<a href="admin_userDetail.go?user_id='+list[i].user_id+'">';
        if (list[i].profile == '' || list[i].profile == null){
            tags += '<i class="bi bi-person-circle"></i> ';
        } else {
            tags += '<div class="profile" style="background-image: url(\'/photo/'+list[i].profile+'\')"></div> ';
        }
        tags += list[i].user_id+' ('+list[i].nick+')';
        tags += '</a></td>';
        tags += '<td>'+list[i].email+'</td>';
        tags += '<td>'+list[i].name+'</td>';
        tags += '<td>'+list[i].board_cnt+' 건</td>';
        if (list[i].last_regdate == ""){
            tags += '<td>이용내역 없음</td>';
        } else {
            tags += '<td>'+list[i].last_regdate+'</td>';
        }
        if (!list[i].restrict_state){
            tags += '<td><button class="mainbtn minbtn">이용중</button></td>';
        } else {
            tags += '<td><button class="cautionbtn minbtn">이용제재</button></td>';
        }
        tags += '<td>'+list[i].cleared_date_String+'</td>';
        tags += '</tr>';
    }
    document.getElementsByTagName('tbody')[0].innerHTML = tags;
}