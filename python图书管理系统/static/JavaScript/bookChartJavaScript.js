function createBookChart() {
  const bookTotalNumberCtx = $("#bookTotalNumber");
  const bookTotalNumberlabels = ['哲学', '人文社会科学', '文学艺术', '历史地理', '自然应用科学'];  // 设置 X 轴上对应的标签
  const bookTotalNumberdata = {
    labels: bookTotalNumberlabels,
    datasets: [{
      label: '书籍总数统计',
      data: [165, 259, 180, 481, 156],
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
  const bookTotalNumberconfig = {
    type: 'bar', // 设置图表类型
    data: bookTotalNumberdata,  // 设置数据集
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
  const bookTotalNumber = new Chart(bookTotalNumberCtx, bookTotalNumberconfig);

  const bookNewNumberCtx = $("#bookNewNumber");
  const bookNewNumberlabels = ['哲学', '人文社会科学', '文学艺术', '历史地理', '自然应用科学'];  // 设置 X 轴上对应的标签
  const bookNewNumberdata = {
    labels: bookNewNumberlabels,
    datasets: [{
      label: '本月新增统计',
      data: [16, 29, 10, 2, 1],
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
  const bookNewNumberconfig = {
    type: 'bar', // 设置图表类型
    data: bookNewNumberdata,  // 设置数据集
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
  const bbookNewNumber = new Chart(bookNewNumberCtx, bookNewNumberconfig);
}