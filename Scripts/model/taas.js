app.controller('taasApp', function($scope, playerService){
$scope.newPlayerName = "";

$scope.players = [];

$scope.totalPlayers = function(){
return $scope.players.length;
}

$scope.Addplayer = function(){
  var player = new Player($scope.newPlayerName);
   $scope.players.push(player);
   $scope.newPlayerName = "";
}

$scope.Calculate = function(){
  playerService.submit($scope.players);
};
});