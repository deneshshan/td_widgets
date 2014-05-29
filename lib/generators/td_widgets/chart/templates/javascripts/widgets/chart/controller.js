app.controller("ChartCtrl", ["$scope", "EditorFormOptions", "TdWidgetsEditorFormOptions",
  function($scope, EditorFormOptions, TdWidgetsEditorFormOptions) {

  var defaults = {
    size_x: 1,
    size_y: 2,
    chart_type: 'pie',
    update_interval: 3600
  };

  if(!$scope.widget.id){
    _.extend($scope.widget, defaults);
  }

  $scope.chartTypes = TdWidgetsEditorFormOptions.chartTypes;
  $scope.updateIntervals = EditorFormOptions.updateIntervals;

}]);
