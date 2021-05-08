using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace LaundryApp.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }

        [DisplayName("Product")]
        public string ProductName { get; set; }

        [DisplayName("Qty")]
        public int ProductQty { get; set; }

        [DisplayName("Rate")]
        [DataType(DataType.Currency)]
        public double ProductRate { get; set; }

        [DisplayName("Amount")]
        [DataType(DataType.Currency)]
        public double ProductAmount { get; set; }
    }
}
