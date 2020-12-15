using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LaundryApp.Models;
namespace LaundryApp.Repository
{
    public class ProductRepository
    {
        DataAccessLogic db = new DataAccessLogic();
        public DataTable GetProductDetails()
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            DataTable dt = db.GetData("sp_GetAllProducts", dict);
            return dt;
        }
    }
}
