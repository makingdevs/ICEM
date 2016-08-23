class App.Map
  
  constructor: ->
    @start()

  start: -> 
    $.get("/map/data?indicator=VI").done (response) =>
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
          minColor: '#FFFFFF'
          maxColor: response.color
        }
        legend: {
          enabled: false
        }
        exporting: {
          enabled: false
        }
        series: [ {
          data: response.data
          mapData: Highcharts.maps['countries/mx/mx-all']
          joinBy: 'hc-key'
          states: hover: color: '#BADA55'
          dataLabels:
            enabled: true
            format: '{point.name}'
        } ]
      @bindEvents()
      @checkRadio()

  checkRadio: ->
    $("#Vivienda_map").attr("checked","checked")
  
  bindEvents: ->
    $(".with-gap").on("click", @lookUpChanges)
  
  #TODO refactor de metodo
  lookUpChanges: (event) =>
    $.get("/map/data?indicator=#{$(event.target).attr('code')}").done (response) =>
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
          minColor: '#FFFFFF'
          maxColor: response.color
        }
        legend: {
          enabled: false
        }
        exporting: {
          enabled: false
        }
        series: [ {
          data: response.data
          mapData: Highcharts.maps['countries/mx/mx-all']
          joinBy: 'hc-key'
          states: hover: color: '#BADA55'
          dataLabels:
            enabled: true
            format: '{point.name}'
        } ]
  