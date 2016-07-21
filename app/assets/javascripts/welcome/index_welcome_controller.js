var IndexWelcomeController = (function(){

  var start = function() {
    initSlider();
    MultiseriesLineChart.start();
  };

  var initSlider = function(){
    noUiSlider.create($("#range").get( 0 ), {
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
      }
    });
  };

  var bindEvents = function() {
  };

  return {
    start: start
  };

}());

$(function ($) {
  IndexWelcomeController.start();
});