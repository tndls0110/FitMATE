let data;
let chart;
let chartData = [];

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

getTableData();
getChartData();

function getTableData() {
    $.ajax({
        type: 'post',
        url: 'admin_getDashboardTableData.ajax',
        data: {},
        dataType: 'json',
        success: function(data) {
            drawTable(data.cnt);
        },
        error: function(e) {}
    });
}

function drawTable(list) {
    for (var i = 0; i < list.length; i++) {
        document.getElementsByClassName('cnt'+i)[0].innerHTML = list[i];
    }
}

function getChartData() {
    $.ajax({
        type: 'post',
        url: 'admin_getDashboardChartData.ajax',
        data: {},
        dataType: 'json',
        success: function(data) {
            for (let i = 0; i < 5 ; i++) {
                chartData.push([getChartDate(4-i), data.cnt[0+i], data.cnt[5+i], data.cnt[10+i], data.cnt[15+i]]);
            }
            google.charts.load('current', {
                'packages':['corechart']
            });
            google.charts.setOnLoadCallback(drawVisualization);
            clearInterval(waitingInterval);
            document.getElementsByClassName('waiting')[0].style.display = 'none';
        },
        error: function(e) {}
    });
}

function getChartDate(i) {
    let today = new Date();
    today.setDate(today.getDate() - i);
    return (today.getMonth() + 1).toString() + '/' + today.getDate().toString();
}

function drawVisualization() {
    data = new google.visualization.DataTable();
    data.addColumn('string', '날짜');
    data.addColumn('number', '회원');
    data.addColumn('number', '게시글');
    data.addColumn('number', '크루');
    data.addColumn('number', '신고');
    data.addRows(
        chartData
    );
    var options = {
        width: '100%',
        height: 250,
        seriesType: 'bars',
        series: {
            0: {
                type: 'line',
                curveType: 'function',
                color: '#048187'
            },
            1: {
                color: '#cecece'
            },
            2: {
                color: '#aaa'
            },
            3: {
                color: '#848484'
            }
        },
        bar: {
            groupWidth: '50%'
        },
        animation:{
            "startup": true,
            duration: 500,
            easing: 'out'
        },
        axisTitlesPosition: 'none',
        chartArea: {
            left: 20,
            top: 24,
            width: 540,
            height: 210
        },
        hAxis: {
            format: 'decimal',
            gridlines: {
                color: '#7d7d7d'
            },
            textStyle: {
                fontSize: 12
            }
        },
        vAxis: {
            format: 'decimal',
            gridlines: {
                color: '#E1E4EA'
            },
            textStyle: {
                fontSize: 10
            }
        },
        legend: {
            position: 'in'
        },
        tooltip: {
            textStyle: {
                color: '#7d7d7d',
                fontSize: 12
            }
        }
    };
    chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}