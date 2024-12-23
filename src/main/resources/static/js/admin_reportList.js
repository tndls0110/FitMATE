// 신고 목록 출력
let showPage = 1;
let cnt = 15;
let vPages = 10;

const searchParams = new URLSearchParams(window.location.search);
let searchType = searchParams.get('searchType');
let keywords = searchParams.get('keywords');
let sortType = searchParams.get('sortType');

sorterChanger();

function sorterChanger() {
    let sort = document.getElementsByName('sortType')[0];
    let btn = document.getElementsByClassName('ankerbtn')[0];
    switch (sortType){
        case '':
            sort.value = 'reported';
            btn.innerHTML = '상태 <i class="bi bi-funnel-fill" style="font-size: 14px;"></i>';
            break;
        case 'reported':
            sort.value = 'inProgress';
            btn.innerHTML = '신고 <i class="bi bi-funnel" style="font-size: 14px;"></i>';
            break;
        case 'inProgress' :
            sort.value = 'blind';
            btn.innerHTML = '처리중 <i class="bi bi-funnel" style="font-size: 14px;"></i>';
            break;
        case 'blind':
            sort.value = 'completed';
            btn.innerHTML = '블라인드 <i class="bi bi-funnel" style="font-size: 14px;"></i>';
            break;
        case 'completed' :
            sort.value = '';
            btn.innerHTML = '처리완료 <i class="bi bi-funnel" style="font-size: 14px;"></i>';
            break;
    }
}

let waitingInterval = setInterval(waitingAnimator, 150);

function waitingAnimator() {
    let waiting = document.getElementsByClassName('waiting')[0];
    if (waiting.innerHTML == '<i class="bi bi-reception-0"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-1"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-1"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-2"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-2"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-3"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-3"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-4"></i>';
    } else if (waiting.innerHTML == '<i class="bi bi-reception-4"></i>') {
        waiting.innerHTML = '<i class="bi bi-reception-0"></i>';
    }
}

pageShow(showPage);

function pageShow(page) {
    $.ajax({
        type: 'post',
        url: 'report_list.ajax',
        data: {
            'page': page,
            'cnt': cnt,
            'opt': searchType,
            'keyword': keywords,
            'sortType': sortType
        },
        dataType: 'json',
        success: function(data) {
            listPrint(data.list, data.totalIdx, data.currentPage, data.offset);
            clearInterval(waitingInterval);
            document.getElementsByClassName('waitingContainer')[0].style.display = 'none';

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
    let substr = 28;
    for (let i = 0; i < list.length; i++) {
        tags += '<tr>';
        tags += '<td>'+(totalIdx - ( (currentPage - 1) * cnt) - i)+'</td>';
        tags += '<td class="left">';
        if (list[i].file_cnt > 0 && list[i].board_type == 1){
            tags += '<i class="bi bi-images"></i> ';
        }
        tags += '<a href="admin_reportDetail.go?report_idx='+list[i].report_idx+'">';
        if (list[i].board_type == 1){
            if (list[i].subject.length > substr){
                tags += list[i].subject.substring(0,substr) +'…';
            } else {
                tags += list[i].subject;
            }
        } else if (list[i].board_type == 2){
            if (list[i].content.length > substr){
                tags += list[i].content.substring(0,substr) +'…';
            } else {
                tags += list[i].content;
            }
        }
        tags += '</a></td>';
        tags += '<td>';
        if (list[i].reportr_con.length > 8){
            tags += list[i].reportr_con.substring(0,8) +'…';
        } else {
            tags += list[i].reportr_con;
        }
        tags += '</td>';
        tags += '<td>'+list[i].reporter_id+'</td>';
        tags += '<td>'+list[i].reported_id+'</td>';
        tags += '<td>'+list[i].report_date+'</td>';
        switch (list[i].report_prog) {
            case 1:
                tags += '<td><button class="cautionbtn minbtn">'+list[i].report_state+'</button></td>';
                break;
            case 2:
                tags += '<td><button class="mainbtn minbtn">'+list[i].report_state+'</button></td>';
                break;
            default:
                tags += '<td><button class="subbtn minbtn">'+list[i].report_state+'</button></td>';
                break;
        }
        tags += '</tr>';
    }
    document.getElementsByTagName('tbody')[0].innerHTML = tags;
}