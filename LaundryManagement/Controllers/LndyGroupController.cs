using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaundryApp.BussinessLogic;
using LaundryApp.Models;
namespace LaundryManagement.Controllers
{
    public class LndyGroupController : Controller
    {
        // GET: Home
        BLLaundryGroup db = new BLLaundryGroup();
        public ActionResult Group()
        {
            return View(db.GetLaundryGroups());
        }

        [HttpPost]
        public ActionResult Group(LaundryGroup lgrp)
        {
           int i= db.SaveGroup(lgrp);
            if (i > 0)
            {
                return RedirectToAction("Group");
            }
            else
            {
                return View(lgrp);
            }

        }
    }
}