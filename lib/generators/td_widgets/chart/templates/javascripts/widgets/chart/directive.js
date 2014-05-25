app.directive("chart", ["ChartModel", function(ChartModel) {
  return {
    templateUrl: join('<div ac-chart="', chartType, '" ac-data="data" ac-config="config" id="chart" class="chart"></div>')
  };
}]);
