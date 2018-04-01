/**
 * 
 */

//pie
var ctxP = document.getElementById("pieChart").getContext('2d');
var myPieChart = new Chart(ctxP, {
    type: 'pie',
    data: {
        labels: ["Meeting", "Report", "Interview", "RegularCheck", "Requirement", "ClientMeeting"],
        datasets: [
            {
                data: [13, 7, 2, 3, 5, 4],
                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#be91d2"],
                hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774", "#c9a2db"]
            }
        ]
    },
    options: {
        responsive: true
    }    
});
            

//bar
var ctxB = document.getElementById("barChart").getContext('2d');
var myBarChart = new Chart(ctxB, {
  type: 'bar',
  data: {
      labels: ["MTN00001", "MTN00005", "MTN00007", "MTN00010", "MTN00011", "MTN00017"],
      datasets: [{
          label: 'Meeting Note of Hit',
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
              'rgba(255,99,132,1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
      }]
  },
  options: {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero:true
              }
          }]
      }
  }
});
                 



//doughnut
var ctxD = document.getElementById("doughnutChart").getContext('2d');
var myLineChart = new Chart(ctxD, {
  type: 'doughnut',
  data: {
      labels: ["IBM", "BTS", "Mamaoo", "RedVelvet"],
      datasets: [
          {
              data: [300, 140, 100, 40],
              backgroundColor: ["#F7464A", "#be91d2", "#FDB45C", "#46BFBD"],
              hoverBackgroundColor: ["#FF5A5E", "#c9a2db", "#FFC870", "#5AD3D1"]
          }
      ]
  },
  options: {
      responsive: true
  }    
});
  


//wordCloud
d3.wordcloud()
.selector('#wordcloud')
.words([{text: '강종', size: 15}, 
        {text: '수주', size: 16},
        {text: '관리', size: 17},
        {text: '납기', size: 18},
        {text: '고객', size: 19},
        {text: '발주', size: 10},
        {text: '손익', size: 20},
        {text: '왓슨', size: 21},
        {text: '위암', size: 22},
        {text: '치료', size: 30},
        {text: '운영', size: 31},
        {text: '비즈니스', size: 9},
        {text: '데이터', size: 8},
        {text: '소셜미디어', size: 7},
        {text: '생산', size: 11},
        {text: '시스템', size: 10},
        {text: '경영', size: 15},
        {text: '서비스', size: 15},
        {text: '문화', size: 14},
        {text: '재고', size: 17},
        {text: 'IBM', size: 60},
        {text: '트위터', size: 7},
        {text: '아웃소싱', size: 15},
        {text: '플랫폼', size: 15},
        {text: 'eph', size: 15},
        {text: '한국', size: 15},
        {text: 'SLT', size: 15},
        {text: 'SI', size: 15},
        {text: 'SM', size: 15},
        {text: '운영', size: 15},
        {text: '송도', size: 15},
        {text: '서울', size: 15},
        {text: '종로', size: 15}
        ])
.start();

$("text").each(function(){
  if ($(this).text() == 'IBM'){
    $(this).css("font-size", "40px");
  } 
  if ($(this).text() == 'eph'){
    $(this).css("font-size", "30px");
  } 
});