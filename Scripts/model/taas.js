app.controller('taasApp', function ($scope, playerService) {
    $scope.newPlayerName = "";

    $scope.players = [];

    $scope.totalPlayers = function () {
        return $scope.players.length;
    }


    $scope.GetPlayers = function() {
        var player1 = new Player('Raj');
        var player2 = new Player('Beecase');
        var player3 = new Player('Aista');
        $scope.players.push(player1);
        $scope.players.push(player2);
        $scope.players.push(player3);
    };

    $scope.Addplayer = function () {
        var player = new Player($scope.newPlayerName);
        $scope.players.push(player);
        $scope.newPlayerName = "";
    }

    $scope.TotalMalsForPlayer = [];


    $scope.DisplayTotalMal = false;

    $scope.TotalMalCalc = function(data) {
        $scope.TotalMalsForPlayer = data;
        $scope.DisplayTotalMal = true;
    };

    $scope.Calculate = function () {
        playerService.submit($scope.players, $scope.TotalMalCalc);
    };
});