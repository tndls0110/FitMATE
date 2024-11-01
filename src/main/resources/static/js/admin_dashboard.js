google.charts.load('current', {
    'packages':['corechart']
});

google.charts.setOnLoadCallback(drawVisualization);

var chartData = [
    ['날짜', '회원', '게시글', '크루', '신고'],
    ['', 0, 0, 0, 0],
    ['', 0, 0, 0, 0],
    ['', 0, 0, 0, 0],
    ['', 0, 0, 0, 0]
];
getChartData();

function drawVisualization() {
    var data = google.visualization.arrayToDataTable(
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
    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}

function getChartData() {
    for (let i = 1; i < 5; i++) {
        let today = new Date();
        today.setDate(today.getDate() - i);
        //calculateDate(today, i);
        getData(i);
    }
}

function calculateDate(today, i) {
    chartData[i][0] = (today.getMonth() + 1).toString() + '/' + today.getDate().toString();
}

function getData(i) {
    $.ajax({
        type: 'post',
        url: 'getData.ajax',
        data: {
            'i': i
        },
        dataType: 'json',
        success: function(data) {
            chartData[i][2] = data.cnt.member;
            chartData[i][3] = data.cnt.board;
            chartData[i][4] = data.cnt.crew;
            chartData[i][5] = data.cnt.report;
        },
        error: function(e) {}
    });
}