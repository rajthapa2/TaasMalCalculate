﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

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

    <div ng-controller="taasApp">
        <div class="container">
            <h1><small>Marriage Mal Calculator</small></h1>
            <h2><small>Total Players            {{totalPlayers()}}</small></h2>
            <br />
            <div>

                <div class="row">
                    <div class="col-xs-4">
                        <input class="form-control input-lg" type="text" ng-model="newPlayerName" id="formGroupInputLarge" placeholder="Name of Player">
                    </div>
                    <div class="input-group col-xs-3 col-md-offset-5">
                        <div class="input-group-addon input-lg">Point</div>
                        <input class="form-control input-lg" ng-model="pensePerPoint" type="text" placeholder="Point">
                    </div>

                </div>

                <br />
                <input class="btn btn-success" type="button" value="Add Player" ng-click="Addplayer()">
                <br />
                <br />
                <label id="max-players-error" ng-show="displayErrorMessage" class="control-label">You can't have more than 5 players</label>
                <span id="hide-error-message" ng-show="displayErrorMessage" ng-click="HideShowErrorMessage()" class="glyphicon glyphicon-remove"></span>
            </div>

            <br />

            <div id="players-section" ng-show="ShowPlayersSection()">
                <div class="row">
                    
                    
                    <ul class="row">
                        <li class="col-md-3">Name</li>
                        <li class="col-md-2">Mall</li>
                        <li class="col-md-2">GameWon</li>
                        <li class="col-md-2">MallSeen</li>
                        <li class="col-md-2">Dublie</li>
                        <li class="col-md-2"></li>
                    </ul>
                    <ul ng-repeat="player in players" class="row">
                        <li class="col-md-3">
                            <input ng-model="player.Name" type="text" />
                        </li>
                        <li class="col-md-2">
                            <input ng-model="player.Mal" type="checkbox" />
                        </li>
                        <li class="col-md-2">
                            <input ng-click="UpdateGameWon($index)" ng-model="player.GameWon" type="checkbox" />
                        </li>
                        <li class="col-md-2">
                            <input ng-change="UpdateMalSeen($index)" ng-model="player.MalSeen" type="checkbox" />
                        </li>
                        <li class="col-md-2">
                            <input ng-model="player.Dubliee" type="checkbox" ng-change="UpdateDubliee($index)" />
                        </li>
                        <li class="col-md-1">
                            <span ng-click="removePlayer($index)" class="glyphicon glyphicon-remove remove-player"></span>
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
                                <span class="col-md-2">Name:</span>
                                <span class="col-md-2">Points</span>
                                <span class="col-md-2">Money</span>
                            </strong>
                            <br />
                            <li ng-repeat="player in TotalMalsForPlayer.Players">
                                <span class="col-md-2">{{player.Name}}</span>
                                <span class="col-md-2">{{player.TotalPoints}}</span>
                                <span class="col-md-2">{{player.MoneyPoints}}</span>
                                <br />
                            </li>
                        </ul>
                        <%--                        <div class="col-md-4 col-md-offset-2">--%>
                        <%--                            <span ng-click="pushPlayers()" class="btn btn-success">Push</span>--%>
                        <%--                        </div>--%>
                    </div>

                    <%--                    <div>--%>
                    <%--                        <ul>--%>
                    <%--                            <li ng-repeat="p in roundMalResult">--%>
                    <%--                                <span ng-repeat="pl in p"></span>--%>
                    <%--                            </li>--%>
                    <%----%>
                    <%--                        </ul>--%>
                    <%----%>
                    <%--                    </div>--%>
                </div>
            </div>
            <button style="float: right;" type="button" class="btn btn-default btn-lg active" ng-show="showGetPlayersButton" ng-click="GetPlayers()">Get Home Players</button>
        </div>
    </div>
</body>
