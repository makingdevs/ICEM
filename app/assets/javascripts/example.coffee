#= require app

class App.Example
  
  constructor: ->
    @start()

  start: -> 
    $.get("/example/data").done (data) =>
      $('#container').highcharts 'Map',
        title: text: ''
        mapNavigation:
          enabled: true
          buttonOptions: verticalAlign: 'bottom'
        plotOptions: series: point: events: click: ->
          window.location.assign('/states?name='+ @name)
          return
        credits: {
          enabled: false
        }
        colorAxis: {
          min: 1
          max: 10
          type: 'logarithmic'
          minColor: '#d1ecff'
          maxColor: '#1F77B4'
        }
        legend: {
          enabled: false
        }
        exporting: {
          enabled: false
        }
        series: [ {
          data: data
          mapData: Highcharts.maps['countries/mx/mx-all']
          joinBy: 'hc-key'
          states: hover: color: '#BADA55'
          dataLabels:
            enabled: true
            format: '{point.name}'
        } ]
      @bindEvents()
  
  bindEvents: ->
    $(".with-gap").on("click", @lookUpChanges)
  
  lookUpChanges: (event) =>
    $.get("/example/data?indicator=#{$(event.target).attr('id')}").done (data) =>
      $('#container').highcharts 'Map',
        title: text: ''
        mapNavigation:
          enabled: true
          buttonOptions: verticalAlign: 'bottom'
        plotOptions: series: point: events: click: ->
          window.location.assign('/states?name='+ @name)
          return
        credits: {
          enabled: false
        }
        colorAxis: {
          min: 1
          max: 10
          type: 'logarithmic'
          minColor: '#d1ecff'
          maxColor: '#1F77B4'
        }
        legend: {
          enabled: false
        }
        exporting: {
          enabled: false
        }
        series: [ {
          data: data
          mapData: Highcharts.maps['countries/mx/mx-all']
          joinBy: 'hc-key'
          states: hover: color: '#BADA55'
          dataLabels:
            enabled: true
            format: '{point.name}'
        } ]
  
new App.Example()