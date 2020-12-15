using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryApp.Models
{
    public class LaundryGroup
    {
        [Key]
        public int GroupId { get; set; }
        [Required]
        public string GroupName { get; set; }
        [Required]
        public string Code { get; set; }
        [Required]
        public string ColorCode { get; set; }
        [Required]
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public int UpdatedBy { get; set; }

    }
    public class GetLaundryGruopModel
    {
        public LaundryGroup lgroup { get; set; }
        public List<LaundryGroup> lgroups { get; set; }
    }
}
