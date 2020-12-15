using LaundryApp.BussinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaundryApp.Models;

namespace LaundryManagement.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        BLLaundryProduct db = new BLLaundryProduct();
        public ActionResult GetProduct()
        {
            LaundryProduct prod = new LaundryProduct(); 
            return View(db.GetProduct());
        }
    }
}
 
 