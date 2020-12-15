using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaundryApp.BussinessLogic;
using LaundryApp.Models;
namespace LaundryManagement.Controllers
{
    [Authorize]
    public class LndyGroupController : Controller
    {
        // GET: Home
        BLLaundryGroup db = new BLLaundryGroup();
        public ActionResult Group()
        {
            GetLaundryGruopModel lg = new GetLaundryGruopModel();
            
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
       
        public ActionResult GroupById(int? id)
        {
            ViewBag.group = db.getGroupById(id);
            return View("Group");
        }

        [HttpPost]
        public ActionResult UpdateGroup(LaundryGroup lgrp)
        {
            int i = db.UpdateGroup(lgrp);
            if (i > 0)
            {
                return RedirectToAction("Group");
            }
            else
            {
                return View(lgrp);
            }

        }
        [HttpPost]
        public ActionResult DeleteGroup(int? deleteGroupId)
        {
            int i = db.DeleteGroup(deleteGroupId);
            if (i > 0)
            {
                return RedirectToAction("Group");
            }
            else
            {
                return View();
            }

        }
        
    }
}