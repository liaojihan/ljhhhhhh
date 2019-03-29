let flow_charts = echarts.init(document.getElementById('flow_charts'));
flow_charts.showLoading();

let option = {
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    legend: {
        data: ['请求数']
    },
    grid: {
        left: '1%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis:  {
        type: 'value',
        position: 'top'
    },
    yAxis: {
        type: 'category',
        data: []
    },
    dataZoom: [
        {
            type: 'slider',
            show: true,
            yAxisIndex: [0],
            left: '97%',
            start: 60,
            end: 100
        }
    ],
    series: []
};

$.ajax({
    url: "/monitor/logininfor/userInfo",
    dataType: 'json',
    type: 'get',
    success: data => {
        option.series = [
            {
                name: '请求数',
                type: 'bar',
                stack: '总量',
                barWidth: '30%',
                data: data['info']
            }
        ];
        option.yAxis.data = data['date'];
        flow_charts.setOption(option);
        flow_charts.hideLoading();
    }
});