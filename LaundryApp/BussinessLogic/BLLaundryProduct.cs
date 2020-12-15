using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LaundryApp.Models;
using System.Data;
using LaundryApp.Repository;

namespace LaundryApp.BussinessLogic
{
    public class BLLaundryProduct: ProductRepository
    {
        public List<LaundryProduct> GetProduct()
        {
            List<LaundryProduct> listproduct = new List<LaundryProduct>();
            DataTable dt = GetProductDetails();
            foreach (DataRow dr in dt.Rows)
            {
                LaundryProduct prod = new LaundryProduct();
                prod.ProductId = Convert.ToInt32(dr["ProductId"]);
                prod.ProductName = Convert.ToString(dr["ProductName"]);
                prod.Status = Convert.ToBoolean(dr["Status"]);
                prod.PGroupId = Convert.ToString(dr["PGroupId"]);
                prod.Description = Convert.ToString(dr["Description"]);
                listproduct.Add(prod);
            }
            return listproduct;
        }

        
    }
}
