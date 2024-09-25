function createBorrowChart() {
  const borrowNumberCtx = $("#borrowNumber");
  const borrowNumberlabels = ['哲学', '人文社会科学', '文学艺术', '历史地理', '自然应用科学'];  // 设置 X 轴上对应的标签
  const borrowNumberdata = {
    labels: borrowNumberlabels,
    datasets: [{
      label: '各类书籍借阅总数',
      data: [65, 59, 80, 81, 56],
      backgroundColor: [      // 设置每个柱形图的背景颜色
        'rgba(255, 99, 132, 0.2)',
        'rgba(255, 159, 64, 0.2)',
        'rgba(255, 205, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(54, 162, 235, 0.2)'
      ],
      borderColor: [     //设置每个柱形图边框线条颜色
        'rgb(255, 99, 132)',
        'rgb(255, 159, 64)',
        'rgb(255, 205, 86)',
        'rgb(75, 192, 192)',
        'rgb(54, 162, 235)'
      ],
      borderWidth: 1     // 设置线条宽度
    }]
  };
  const borrowNumberconfig = {
    type: 'bar', // 设置图表类型
    data: borrowNumberdata,  // 设置数据集
    options: {
      responsive: false, // 设置图表为响应式，根据屏幕窗口变化而变化
      maintainAspectRatio: false,// 保持图表原有比例
      scales: {
        y: {
          beginAtZero: true // 设置 y 轴从 0 开始
        }
      }
    },
  };

  const borrowRatectx = $("#borrowRate");
  const borrowRatedata = {
    labels: [
      '哲学',
      '人文社会科学',
      '文学艺术',
      '历史地理',
      '自然应用地理'
    ],
    datasets: [{
      label: '各类书籍借阅占比',
      data: [65, 59, 80, 81, 56],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(255, 159, 64)',
        'rgb(255, 205, 86)',
        'rgb(75, 192, 192)',
        'rgb(54, 162, 235)'
      ],
      hoverOffset: 4
    }]
  };
  const borrowRateconfig = {
    type: 'doughnut',
    data: borrowRatedata,
    options: {
      responsive: false, // 设置图表为响应式，根据屏幕窗口变化而变化
      maintainAspectRatio: false,// 保持图表原有比例
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  };

  const borrowPerMonthctx = $("#borrowPerMonth");
  const borrowPerMonthdata = {
    labels: [
      '一月份',
      '二月份',
      '三月份',
      '四月份',
      '五月份'
    ],
    datasets: [{
      type: 'bar',
      label: '柱形图数据集',
      data: [45, 49, 52, 48, 55],
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgba(255, 99, 132, 0.2)'
    }, {
      type: 'line',
      label: '折线图数据集',
      data: [45, 49, 52, 48, 55],
      fill: false,
      borderColor: 'rgb(54, 162, 235)'
    }]
  };
  const borrowPerMonthconfig = {
    type: 'scatter',
    data: borrowPerMonthdata,
    options: {
      responsive: false, // 设置图表为响应式，根据屏幕窗口变化而变化
      maintainAspectRatio: false,// 保持图表原有比例
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  };
  const borrowPerMonth = new Chart(borrowPerMonthctx, borrowPerMonthconfig);
  const borrowRate = new Chart(borrowRatectx, borrowRateconfig);
  const borrowNumber = new Chart(borrowNumberCtx, borrowNumberconfig);
}