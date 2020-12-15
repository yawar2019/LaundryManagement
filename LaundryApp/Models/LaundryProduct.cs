using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryApp.Models
{
    public class LaundryProduct
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string PGroupId { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }
        public bool Status { get; set; }
        public int CreatedBy { get; set; }
        public int UpdatedBy { get; set; }

    }
}
