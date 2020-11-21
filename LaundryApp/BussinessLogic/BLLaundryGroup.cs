using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LaundryApp.Models;
using System.Data;
using System.Data.SqlClient;
using LaundryApp.Repository;

namespace LaundryApp.BussinessLogic
{
    public class BLLaundryGroup : LaundryGroupRepository
    {

        public List<LaundryGroup> GetLaundryGroups()
        {
            List<LaundryGroup> listlg = new List<Models.LaundryGroup>();
            DataTable dt = GetLaundryGroupsDetails();
            foreach (DataRow dr in dt.Rows)
            {
                LaundryGroup lg = new LaundryGroup();
                lg.GroupId = Convert.ToInt32(dr["GroupId"]);
                lg.GroupName = Convert.ToString(dr["GroupName"]);
                lg.IsActive = Convert.ToBoolean(dr["IsActive"]);
                lg.Code = Convert.ToString(dr["Code"]);
                lg.ColorCode = Convert.ToString(dr["ColorCode"]);
                listlg.Add(lg);
            }
            return listlg;
        }

        public int SaveGroup(LaundryGroup lgrp)
        {
            int i = SaveGroupDet(lgrp);
            return i;
        }

        public LaundryGroup getGroupById(int? id)
        {
            LaundryGroup lg = new LaundryGroup();
            DataTable dt = GetLaundryGroupDetailById(id);
            foreach (DataRow dr in dt.Rows)
            {

                lg.GroupId = Convert.ToInt32(dr["GroupId"]);
                lg.GroupName = Convert.ToString(dr["GroupName"]);
                lg.IsActive = Convert.ToBoolean(dr["IsActive"]);
                lg.Code = Convert.ToString(dr["Code"]);
                lg.ColorCode = Convert.ToString(dr["ColorCode"]);
               
            }
            return lg;
        }
    }
}

