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
        public static List<Product> ProductList;
        public static List<Product> ViewProductList;

        public ActionResult GetProduct()
        {
            LaundryProduct prod = new LaundryProduct(); 
            return View(db.GetProduct());
        }

        static ProductController()
        {
            ViewProductList = new List<Product>();

            ProductList = new List<Product>() {
                new Product{ ProductId = 1, ProductName= "Shirt", ProductQty=0, ProductRate = 2 },
                new Product{ ProductId = 2, ProductName= "Trouser", ProductQty=0, ProductRate = 3 },
                new Product{ ProductId = 3, ProductName= "Saree", ProductQty=0, ProductRate = 4 },
                new Product{ ProductId = 4, ProductName= "Skirt", ProductQty=0, ProductRate = 5 },
                new Product{ ProductId = 5, ProductName= "Blazor", ProductQty=0, ProductRate = 6 },
            };
        }

        // GET: Product
        public ActionResult Index()
        {
            //ViewBag.Msg = @"<p>Selected items: {ViewProductList.Count} <p>";
            return View(ViewProductList);
        }

        public ActionResult AddProduct(int id)
        {
            Product product = ProductList.First(m => m.ProductId == id);
            bool productFound = ViewProductList.Contains(product);

            if (!productFound)
            {
                ViewProductList.Add(product);
            }

            return RedirectToAction("Index");
        }

        public ActionResult DeleteProductFromView(int id)
        {
            // Remove the requested product from the list
            if (ViewProductList.Count > 0)
            {
                ViewProductList.Remove(ViewProductList.First(m => m.ProductId == id));
            }

            return RedirectToAction("Index");
        }

        public ActionResult UpdateProductView(int id, int? ProductQty)
        {
            return RedirectToAction("Index");
        }
    }
}
 
 