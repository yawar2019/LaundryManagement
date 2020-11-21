﻿using System;
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
        public string GroupName { get; set; }
        public string Code { get; set; }
        public string ColorCode { get; set; }
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
