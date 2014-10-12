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
    <script src="../../Scripts/bootstrap.js"></script>
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Content/style.css" >
	
</head>

<body>

 <!--	<h2>Welcome to ASP.NET MVC <%: ViewData["Version"] %> on <%: ViewData["Runtime"] %>!</h2> -->
    
 <h1>Welcome to Dashian Program</h1>


 <div ng-controller="taasApp"> 
 <input id="name-input-box" type="text" ng-model="newPlayerName" />
 <input class="btn btn-success" type="button" value="Add Player" ng-click="Addplayer()">

  <span>Total Players</span>

  <span ng-bind="totalPlayers()"></span>
  <br />
  <br />
  <br />
  
  <input style="float: right;" type="button" name="getDefaultPlayers" value="getDefaultPlayers" ng-click="GetPlayers()" />
     
     
     <div class="form-group">
         <span class="col-md-1">Name</span>
         <span class="col-md-1">Mall</span>
         <span class="col-md-1">MallSeen</span>
         <span class="col-md-1">GameWon</span>
     </div>
     <br />
    <ul style ="list-style-type: none">
        <li ng-repeat="player in players">
            <input id="nameCheckbox"  ng-model="player.Name" type="text"/>
            <input id="mallCheckbox" ng-model="player.Mal" type="text"/>
            <input id="mallSeenCheckbox"  class="space" ng-model="player.MalSeen" type="checkbox"/>
            <input id="gameWonCheckbox"  class="space" ng-model="player.GameWon" type="checkbox"/>           
        </li>
    </ul>
     
     <br />
    <input type="submit" ng-click="Calculate()" class="btn btn-lg btn-primary" value="submit" />
     
     <br />
     
     <h1 ng-show="DisplayTotalMal">Total Mal :{{TotalMalsForPlayer.TotalMal}}</h1>

     <ul style="list-style-type:  none">
         <li ng-repeat="player in TotalMalsForPlayer.Players">           
             <span ng-bind="player.Name"></span>
             <span ng-bind="player.TotalPoints"> </span>
         </li>
     </ul>

 </div>

</body>

