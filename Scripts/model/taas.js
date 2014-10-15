﻿app.controller('taasApp', function ($scope, playerService) {
    $scope.newPlayerName = "";

    $scope.players = [];

    $scope.displayErrorMessage = false;

    $scope.totalPlayers = function () {
        return $scope.players.length;
    }

    $scope.ShowPlayersSection = function() {
        return $scope.players.length != 0;
    };

    $scope.showGetPlayersButton = true;

    $scope.roundMalResult = [];

    $scope.pushPlayers = function () {
        $scope.roundMalResult.push($scope.players);
    };

    $scope.GetPlayers = function () {
        $scope.showGetPlayersButton = false;
        var player1 = new Player('Raj');
        var player2 = new Player('Beecase');
        var player3 = new Player('Aista');
        $scope.players.push(player1);
        $scope.players.push(player2);
        $scope.players.push(player3);
    };

    $scope.Addplayer = function () {
        var player = new Player($scope.newPlayerName);
        if ($scope.players.length < 5) {
            $scope.players.push(player);
            $scope.newPlayerName = "";
        } else {
            $scope.displayErrorMessage = true;
            $scope.newPlayerName = "";
        }
    }

    $scope.UpdateMalSeen = function(index) {
        if ($scope.players[index].GameWon) {
            $scope.players[index].MalSeen = true;
        }
    };

    $scope.TotalMalsForPlayer = [];

    $scope.removePlayer= function(index) {
        $scope.players.splice(index, 1);
    }
    $scope.UpdateGameWon = function(index) {
        $scope.players.forEach(function(a) {
            a.GameWon = false;
        });
        $scope.players[index].MalSeen = true;
        $scope.players[index].GameWon = true;
    };

    $scope.DisplayTotalMal = false;

    $scope.TotalMalCalc = function(data) {
        $scope.TotalMalsForPlayer = data;
        $scope.DisplayTotalMal = true;
    };

    $scope.HideShowErrorMessage = function() {
        $scope.displayErrorMessage = false;
    }
    $scope.Calculate = function () {
        playerService.submit($scope.players, $scope.TotalMalCalc);
    };
});