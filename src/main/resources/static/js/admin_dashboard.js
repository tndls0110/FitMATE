google.charts.load('current', {
    'packages':['corechart']
});
google.charts.setOnLoadCallback(drawVisualization);
function drawVisualization() {
    var data = google.visualization.arrayToDataTable(
        getChartData()
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
    var chartData = [];
    chartData.push(['날짜', '회원', '게시글', '크루', '신고']);
    for (let i = 4; i > -1; i--) {
        let date = calculateDate(i);
        console.log(date);
        chartData.push([date, 3, 4, 2, 1]);
    }
    return chartData;
}
function calculateDate(i) {
    let today = new Date();
    today.setDate(today.getDate() - i);
    let month = (today.getMonth() + 1).toString(); // 월은 0부터 시작하므로 +1 필요
    let day = today.getDate().toString();
    let date = month + '/' + day;
    return date;
}