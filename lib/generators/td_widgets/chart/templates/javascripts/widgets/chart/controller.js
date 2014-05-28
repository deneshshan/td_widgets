app.controller("ChartCtrl", ["$scope",  
  function($scope) {

  var defaults = {
    size_x: 1,
    size_y: 2,
    type: 'pie'
  };

  if(!$scope.widget.id){
    _.extend($scope.widget, defaults);
  }

}]);
