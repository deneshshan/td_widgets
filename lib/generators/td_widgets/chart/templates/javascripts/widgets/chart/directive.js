app.directive("chart", ["ChartModel", function(ChartModel) {

  var linkFn = function(scope, elements, attrs, WidgetCtrl) {

    function onSuccess(data) {
      scope.data = data;
      scope.data.label = scope.data.label;
      scope.config = getConfig(); 
      scope.chartType = 'pie'
    }

    function update() {
      return ChartModel.getData(scope.widget).success(onSuccess);
    }

    function getConfig() {
      return {
        title: 'Issues',
        tooltips: true,
        labels: false,
        mouseover: function() { },
        mouseout: function() { },
        click: function() { },
        legend: {
          display: true,
          position: 'left'
        }
      };
    }

    scope.init(update);
  };

  return {
    templateUrl: "templates/widgets/chart/show.html",
    link: linkFn
  };
}]);
