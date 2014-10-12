# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
#= require highcharts
#= require_tree .

$ ->
  $(document).foundation()
  charts = $('.chart')
  for chart in charts
    data = $(chart).data('results')
    keys = $(chart).data('keys')
    name = $(chart).find('.title').text()

    $(chart).find(".chart-container").highcharts({
        title: {
            text: name,
            x: -20 #center
        },
        chart: {
            type: 'bar'
        },
        xAxis: {
            minPadding: 0.05,
            maxPadding: 0.05
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        xAxis: {
            categories: keys
        },
        series: [{
            data: data
        }]
    });

  return
