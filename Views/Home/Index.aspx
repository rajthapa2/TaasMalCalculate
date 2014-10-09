<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head runat="server">
	<title></title>
	<script type="text/javascript" src="../../Scripts/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="../../Scripts/angular.js"></script>
	<script type="text/javascript" src="../../Scripts/model/app.js"></script>
	<script type="text/javascript" src="../../Scripts/model/player.js"></script>
	<script type="text/javascript" src="../../Scripts/model/playerService.js"></script>
	<script type="text/javascript" src="../../Scripts/model/taas.js"></script>
	
    <link rel="stylesheet" type="text/css" href="../../Content/style.css" >
	
</head>

<body>

 <!--	<h2>Welcome to ASP.NET MVC <%: ViewData["Version"] %> on <%: ViewData["Runtime"] %>!</h2> -->

 <h1>Welcome to Dashian Program</h1>


 <div ng-controller="taasApp"> 
 <input type="text" ng-model="newPlayerName" />
 <input type="button" value="Add Player" ng-click="Addplayer()">

  <span>Total Players</span>

  <span ng-bind="totalPlayers()"></span>
  <br />
  <br />
  <br />
  

  <span class="space">Name</span>
  <span class="space">Mall</span>
  <span class="space">MallSeen</span>
  <span class="space">GameWon</span>
  
  
    <ul style ="list-style-type: none">
        <li ng-repeat="player in players">
            <input id="nameCheckbox" ng-model="player.Name" type="text"/>
            <input id="mallCheckbox" ng-model="player.Mall" type="text"/>
            <input class="mallSeenCheckbox" ng-model="player.MallSeen" type="checkbox"/>
            <input class="gameWonCheckbox" ng-model="player.GameWon" type="checkbox"/>           
        </li>
    </ul>

    <input type="submit" ng-click="Calculate()" value="submit" />

 </div>

</body>

