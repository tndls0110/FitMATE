var data;
var chart;
var chartData = [];

getData();

function getData() {
    $.ajax({
        type: 'post',
        url: 'admin_getDashboardData.ajax',
        data: {},
        dataType: 'json',
        success: function(data) {
            for (let i = 0; i < 5 ; i++) {
                chartData.push([getChartDate(4-i), data.cnt[i].member, data.cnt[i].board, data.cnt[i].crew, data.cnt[i].report]);
            }
            google.charts.load('current', {
                'packages':['corechart']
            });
            google.charts.setOnLoadCallback(drawVisualization);
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