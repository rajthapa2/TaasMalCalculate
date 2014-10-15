using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using PlayingCard.Models;

namespace PlayingCard.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //			var mvcName = typeof(Controller).Assembly.GetName ();
            //			var isMono = Type.GetType ("Mono.Runtime") != null;
            //
            //			ViewData ["Version"] = mvcName.Version.Major + "." + mvcName.Version.Minor;
            //			ViewData ["Runtime"] = isMono ? "Mono" : ".NET";
            return View();
        }
        //		[HttpPost]
        //		public List<Player> Calculate(List<Player> players){
        //			return players;B
        //		}

        [HttpPost]
        public string Calculate(List<Player> players)
        {
            var gameWonPlayer = players.Find(x => x.GameWon);
            var malSeenPlayers = players.FindAll(x => x.MalSeen).ToList();
            var totalMals = malSeenPlayers.Sum(player => int.Parse(player.Mal));
            malSeenPlayers.Remove(gameWonPlayer);
            var malUnSeenPlayers = players.FindAll(x => x.MalSeen == false).ToList();

            if (malSeenPlayers.Count > 0)
            {
                for(var i= 0; i<malSeenPlayers.Count; i++)
                {
                    var totalMalEarned = int.Parse(malSeenPlayers[i].Mal) * players.Count;
                    var totalPointEarned = totalMalEarned - (totalMals + 3);
                    malSeenPlayers[i].TotalPoints = totalPointEarned;
                }   
            }

            if (malUnSeenPlayers.Count > 0)
            {
                for (var i = 0; i < malUnSeenPlayers.Count; i++)
                {

                    var totalPointEarned = -(totalMals + 10);
                    malUnSeenPlayers[i].TotalPoints =  totalPointEarned;
                }   
            }

            var totalForGameWonPlayer = 0;

            totalForGameWonPlayer = malSeenPlayers.Sum(x => x.TotalPoints);
            totalForGameWonPlayer += malUnSeenPlayers.Sum(x => x.TotalPoints);

            gameWonPlayer.TotalPoints = -(totalForGameWonPlayer);

            var calculatedList = new List<Player> { gameWonPlayer };

            var completeList=  calculatedList.Concat(malSeenPlayers).Concat(malUnSeenPlayers).ToList();

            var gameResult = new GameResult { Players = completeList, TotalMal = totalMals };

            var result = new JavaScriptSerializer().Serialize(gameResult);
            return result;
        }
    }
}

