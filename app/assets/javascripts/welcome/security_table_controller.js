var SecurityTableController = (function(){

  var start = function() {
    renderTable("");
  };

  var renderTable = function(parameters) {
    $.get($("#security_url").val()+$.param(parameters))
    .done(function(data) {
      var infoTable = parseTSV(data);
      SecurityTableView.render(infoTable);
    })
    .fail(function() {
      console.log("Errorz");
    })
  };

  var parseTSV = function(tsv){
    var lines=tsv.split("\n");
    var result = [];
    var headers=lines[0].split("\t");
    result.push({headers:headers, isHeader:true});
    for(var i=1;i<lines.length;i++){
      var obj = {};
      var currentline=lines[i].split("\t");
      for(var j=0;j<headers.length;j++){
        obj[headers[j]] = currentline[j];
      }
      result.push(obj);
    }
    return result
  }

  return {
    start: start,
    renderTable: renderTable
  };

}());

$(function ($) {
  SecurityTableController.start();
});