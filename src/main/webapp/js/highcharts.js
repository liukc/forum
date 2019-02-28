var user = document.getElementById("user").innerHTML - 0
var manager = document.getElementById("manager").innerHTML - 0
var anonymous = document.getElementById("anonymous").innerHTML - 0
var newsAuthor = document.getElementById("newsAuthor").innerHTML - 0


var chart = Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: '用户类型数量统计'
    },
    subtitle: {
        text: '来源：forum'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: -45  // 设置轴标签旋转角度
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: '人口 (/位)'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        pointFormat: '人口总量: <b>{point.y} 位</b>'
    },
    series: [{
        name: '总人口',
        data: [
            ['user',user],
            ['manager', manager],
            ['anonymous', anonymous],
            [' newsAuthor', newsAuthor]
        ],
        dataLabels: {
            enabled: false,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y}',
            y: 10
        }
    }]
});