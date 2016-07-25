var SecurityTableView = (function() {
  var element = "#displayTableSecurity",
      template = '#security-table-template';

  var render = function render(data) {
    var source = $(template).html();
    var resultTemplate = Handlebars.compile(source);
    var html = resultTemplate(data);
    $(element).html(html);
  };

  return {
    render: render
  };
}());