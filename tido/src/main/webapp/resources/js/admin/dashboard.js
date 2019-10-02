/* globals Chart:false, feather:false */
(function () {
  'use strict'
  
  feather.replace()

  // Graphs
  var ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
      ],
      datasets: [
        {
        data: [
          10,
          30,
          50,
          20,
          10,
          50,
          60
        ],
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      },
      {
      data: [
        45,
        88,
        13,
        32,
        95,
        77,
        26
      ],
      lineTension: 0,
      backgroundColor: 'transparent',
      borderColor: 'red',
      borderWidth: 4,
      pointBackgroundColor: '#007bff'
    }
    
    ]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: false
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
}())
