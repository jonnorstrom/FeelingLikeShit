// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(document).ready(function(){
  /*Your chartist initialization code here*/
    $.ajax({url: '/votes'}).success(function(data){
      var series = data;
      var percentages = [];

      var total = series.reduce(function(a, b) {
        return a + b;
      }, 0);

      for(var i = 0; i < series.length; i++){
        percentages.push((series[i]/total)*100)
      }

      // for(var i = 0; i < percentages.length; i++){
      //   if (percentages[i] === 0) {
      //     percentages.splice(i, 1);
      //     i--
      //   }
      // }

      new Chartist.Pie('.ct-chart',
        {
          series: percentages
        },
        {
          donut: true,
          donutWidth: 100,
          startAngle: 270,
          total: 200,
          showLabel: false
        }
      );
    })
});
