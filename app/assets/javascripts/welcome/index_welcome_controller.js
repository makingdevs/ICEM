var IndexWelcomeController = (function(){

  var slider = $("#range").get( 0 )

  var start = function() {
    initSlider();
    MultiseriesLineChart.start();
    bindEvents();
  };

  var bindEvents = function() {
    slider.noUiSlider.on('change', updateGraph);
    $(".checkbox").on('click', updateGraph)
  };

  var initSlider = function(){
    noUiSlider.create(slider, {
      start: [ 2010, 2015 ],
      step: 1,
      margin: 1,
      connect: true,
      orientation: 'horizontal',
      range: {
        'min': 2010,
        'max': 2015
      },
      pips: {
        mode: 'steps',
        density: 20
      },
      format: {
        to: function ( value ) {
          return value;
        },
        from: function ( value ) {
          return value;
        }
      }
    });
  };

  var updateGraph = function(){
    $(".center-block").removeClass("hidden")
    var queryParams = getQueryParams();
    MultiseriesLineChart.renderGraph(queryParams);
    SecurityTableController.renderTable(queryParams);
  };

  var getQueryParams = function(){
    data = {};
    data.state = "";
    $("#indicators").find("input").each(function(index,selector){
      if ($(selector).is(":checked")) {
        data.state += selector.name.concat(",")
      }
    });
    var range = slider.noUiSlider.get();
    data.startRange = range[0];
    data.endRange = range[1];
    return data
  }

  return {
    start: start
  };

}());

$(function ($) {
  IndexWelcomeController.start();
});