using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    public class DataAccessLogic
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        public DataTable GetData(string spName, Dictionary<string, string> dict)
        {
            SqlCommand cmd = new SqlCommand(spName, con);
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (var item in dict)
            {
                cmd.Parameters.AddWithValue(item.Key, item.Value);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public int SaveData(string spName, Dictionary<string, string> dict)
        {
            SqlCommand cmd = new SqlCommand(spName, con);

            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            foreach (var item in dict)
            {
                cmd.Parameters.AddWithValue(item.Key, item.Value);
            }
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
    }
}
