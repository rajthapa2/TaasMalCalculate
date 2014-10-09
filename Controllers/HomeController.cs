using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace PlayingCard.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index ()
		{
//			var mvcName = typeof(Controller).Assembly.GetName ();
//			var isMono = Type.GetType ("Mono.Runtime") != null;
//
//			ViewData ["Version"] = mvcName.Version.Major + "." + mvcName.Version.Minor;
//			ViewData ["Runtime"] = isMono ? "Mono" : ".NET";
			return View ();
		}
//		[HttpPost]
//		public List<Player> Calculate(List<Player> players){
//			return players;
//		}

		[HttpPost]
		public List<Player> Calculate(){
			return new List<Player>();
		}
	}
}

