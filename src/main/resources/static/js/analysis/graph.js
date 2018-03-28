/**
 * 
 */

//pie
var ctxP = document.getElementById("pieChart").getContext('2d');

var typeName = $('#typeName').val();
var typeCount = $('#typeCount').val();
var typeNameEle = typeName.split(",");
var typeCountEle = typeCount.split(",");
var typeNameArray = new Array();
var typeCountArray = new Array();

for (var i=0; i<typeNameEle.length; i++){
	typeNameArray.push(typeNameEle[i].replace(/[\[\]']+/g,'' ));
	typeCountArray.push(typeCountEle[i].replace(/[\[\]']+/g,'' ));
}

var myPieChart = new Chart(ctxP, {

  type: 'pie',
  data: {
      labels: typeNameArray,
      datasets: [
          {
        	  data: typeCountArray,
              backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
              hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
          }
      ]
  },
  options: {
      responsive: true
  }    
});


//bar
var ctxB = document.getElementById("barChart").getContext('2d');

var noteTitle = $('#noteTitle').val();
var noteHit = $('#noteHit').val();
var noteTitleEle = noteTitle.split(",");
var noteHitEle = noteHit.split(",");
var noteTitleArray = new Array();
var noteHitArray = new Array();

for (var i=0; i<noteTitleEle.length; i++){
	noteTitleArray.push(noteTitleEle[i].replace(/[\[\]']+/g,'' ));
	noteHitArray.push(noteHitEle[i].replace(/[\[\]']+/g,'' ));
	if (i > 4)
		break;
}

var myBarChart = new Chart(ctxB, {
  type: 'bar',
  data: {
      labels: noteTitleArray,
      datasets: [{
    	  label: 'MEETING NOTE HIT RANKING',
          data: noteHitArray,
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
          

//line
var ctxL = document.getElementById("lineChart").getContext('2d');
var myLineChart = new Chart(ctxL, {
  type: 'line',
  data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
          {
              label: "My First dataset",
              fillColor: "rgba(220,220,220,0.2)",
              strokeColor: "rgba(220,220,220,1)",
              pointColor: "rgba(220,220,220,1)",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(220,220,220,1)",
              data: [65, 59, 80, 81, 56, 55, 40]
          },
          {
              label: "My Second dataset",
              fillColor: "rgba(151,187,205,0.2)",
              strokeColor: "rgba(151,187,205,1)",
              pointColor: "rgba(151,187,205,1)",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(151,187,205,1)",
              data: [28, 48, 40, 19, 86, 27, 90]
          }
      ]
  },
  options: {
      responsive: true
  }    
});

          
//doughnut
var ctxD = document.getElementById("doughnutChart").getContext('2d');
var myLineChart = new Chart(ctxD, {
    type: 'doughnut',
    data: {
        labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
        datasets: [
            {
                data: [300, 50, 100, 40, 120],
                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
            }
        ]
    },
    options: {
        responsive: true
    }    
});
