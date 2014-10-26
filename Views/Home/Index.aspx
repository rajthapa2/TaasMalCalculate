<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html ng-app="myApp">
<head runat="server">
    <title>Taas Calculate</title>
    <script type="text/javascript" src="../../Scripts/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="../../Scripts/angular.js"></script>
    <script type="text/javascript" src="../../Scripts/model/app.js"></script>
    <script type="text/javascript" src="../../Scripts/model/player.js"></script>
    <script type="text/javascript" src="../../Scripts/model/playerService.js"></script>
    <script type="text/javascript" src="../../Scripts/model/taas.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Content/style.css">
</head>

<body>

    <div ng-controller="taasApp" class="container">
        <h1><small>Marriage Mal Calculator</small></h1>
        <h2><small>Total Players            {{totalPlayers()}}</small></h2>
        <br />
        <div>

            <div class="row">
                <div class="col-xs-4">
                    <input class="form-control input-lg" type="text" ng-model="newPlayerName" id="formGroupInputLarge" placeholder="Name of Player">
                </div>
                <div class="input-group col-md-3 col-xs-5 col-md-offset-5">
                    <div class="input-group-addon input-lg">
                        Point
                    </div>
                    <input class="form-control input-lg" ng-model="pensePerPoint" type="text" placeholder="Point">
                </div>

            </div>

            <br />

            <div>
                <input class="btn btn-success" type="button" value="Add Player" ng-click="Addplayer()">
                <br />
                <br />
                <label id="max-players-error" ng-show="displayErrorMessage" class="control-label">You can't have more than 5 players</label>
                <span id="hide-error-message" ng-show="displayErrorMessage" ng-click="HideShowErrorMessage()" class="glyphicon glyphicon-remove"></span>

            </div>

        </div>

        <br />

        <div id="players-section" ng-show="ShowPlayersSection()">

            <ul class="row">
                <li class="col-md-3 col-sm-3 col-xs-3">Name</li>
                <li class="col-md-2 col-sm-2 col-xs-2">Maal</li>
                <li class="col-md-1 col-sm-2 col-xs-2">GameWon</li>
                <li class="col-md-1 col-sm-2 col-xs-2">MaalSeen</li>
                <li class="col-md-1 col-sm-1 col-xs-1">Dublie</li>
                <li class="col-md-1 col-sm-1 col-xs-1"></li>
            </ul>

            <ul ng-repeat="player in players" class="row">
                <li class="col-md-3 col-sm-3 col-xs-3">
                    <input class="form-control col-md-2 col-xs-3 col-sm-2" ng-model="player.Name" type="text" />
                </li>
                <li class="col-md-2 col-sm-2 col-xs-2">
                    <input class="form-control mal-checkbox" ng-model="player.Mal" type="text" maxlength="2" />
                </li>
                <li class="col-md-1 col-sm-2 col-xs-2">
                    <input class="checkbox" ng-click="UpdateGameWon($index)" ng-model="player.GameWon" type="checkbox" />
                </li>
                <li class="col-md-1 col-sm-2 col-xs-2">
                    <input ng-change="UpdateMalSeen($index)" ng-model="player.MalSeen" type="checkbox" />
                </li>
                <li class="col-md-1 col-sm-1 col-xs-1">
                    <input ng-model="player.Dubliee" type="checkbox" ng-change="UpdateDubliee($index)" />
                </li>
                <li class="col-md-1 col-sm-1 col-xs-1">
                    <div class="close-button">
                        <span ng-click="removePlayer($index)">X</span>
                    </div>

                </li>
                
            </ul>

            <input type="submit" ng-click="Calculate()" class="btn btn-lg btn-primary" value="submit" />

            <br />

            <div ng-show="DisplayTotalMal">
                <u>
                    <h1 ng-show="DisplayTotalMal"><small>Total Mal :                 {{TotalMalsForPlayer.TotalMal}}</small></h1>
                </u>

                <ul id="computed-players" style="list-style-type: none">
                    <strong>
                        <span class="col-md-3 col-sm-3 col-xs-3">Name:</span>
                        <span class="col-md-3 col-sm-3 col-xs-3">Points</span>
                        <span class="col-md-3 col-sm-3 col-xs-3">Money</span>
                    </strong>
                    <br />
                    <li ng-repeat="player in TotalMalsForPlayer.Players">
                        <span class="col-md-3 col-sm-3 col-xs-3">{{player.Name}}</span>
                        <span class="col-md-3 col-sm-3 col-xs-3">{{player.TotalPoints}}</span>
                        <span class="col-md-3 col-sm-3 col-xs-3">{{player.MoneyPoints}}</span>
                        <br />
                    </li>
                </ul>
            </div>
        </div>
        <%--        <button style="float: right;" type="button" class="btn btn-default btn-lg active" ng-show="showGetPlayersButton" ng-click="GetPlayers()">Get Home Players</button>--%>
        <div></div>
    </div>
</body>
