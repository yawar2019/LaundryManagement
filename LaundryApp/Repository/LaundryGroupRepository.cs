using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using LaundryApp.Models;
using DAL;
namespace LaundryApp.Repository
{
    public class LaundryGroupRepository
    {
        DataAccessLogic db = new DataAccessLogic();
        public DataTable GetLaundryGroupsDetails()
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            DataTable dt = db.GetData("sp_lndryGroup", dict);
            return dt;
        }

        public DataTable GetLaundryGroupDetailById(int? id)
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            dict.Add("@GroupId", Convert.ToString(id));
            DataTable dt = db.GetData("sp_lndryGroupById", dict);
            return dt;
        }
        public int SaveGroupDet(LaundryGroup lgrp)
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            dict.Add("@GroupName", lgrp.GroupName);
            dict.Add("@Code", lgrp.Code);
            dict.Add("@ColorCode", lgrp.ColorCode);
            dict.Add("@IsActive", lgrp.IsActive.ToString());
            dict.Add("@CreatedBy", "1");
            dict.Add("@UpdatedBy", "1");
            int i = db.SaveData("sp_InsertlndryGroup", dict);
            return i;
        }
    }
}