using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaundryApp.Models;
using System.Web.Security;

namespace LaundryManagement.Controllers
{

    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Employee obj)
        {
            if (ModelState.IsValid)
            {
                if (obj.EmpEmail == "Admin@gmail.com" && obj.Password == "Admin")
                {
                    FormsAuthentication.SetAuthCookie(obj.EmpEmail, false);   
                }
                else
                {
                  
                    ViewBag.msg = "Invalid UserName and Password";
                    return View();
                }
                return Redirect("~/LndyGroup/Group");
            }
            else
            {
                return View();
            }
        }
    }
}