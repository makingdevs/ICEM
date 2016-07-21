var IndexWelcomeController = (function(){

  var slider = $("#range").get( 0 )

  var start = function() {
    initSlider();
    MultiseriesLineChart.start();
    bindEvents();
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

  var bindEvents = function() {
    slider.noUiSlider.on('change', function(){
      updateGraph();
    });
  };

  var updateGraph = function(){
    var range = slider.noUiSlider.get()
    var startRange = "startRange="+range[0]
    var endRange = "endRange="+range[1]
    MultiseriesLineChart.updateGrap(startRange+"&"+endRange)
  };

  return {
    start: start
  };

}());

$(function ($) {
  IndexWelcomeController.start();
});