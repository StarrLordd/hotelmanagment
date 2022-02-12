using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MainProject.Models
{
    public class DBManager
    {
        SqlConnection con;
        SqlCommand cmd;
        public DBManager()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["myconstr"].ToString());
        }
        //To execute any Inseet update Delete Command.......

        public bool ExecuteInsertUpdateDelete(string CommandText)
        {
            cmd = new SqlCommand(CommandText, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            int n = cmd.ExecuteNonQuery();
            con.Close();
            return n > 0 ? true : false;
        }

        //To Execute any Select Cmand........

        public DataTable ExecuteSelect(string CommandText)
        {
            SqlDataAdapter da = new SqlDataAdapter(CommandText, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        //TO get(Read) single value from database.....

        public object GetSingleVaue(string CommandText)
        {
            cmd = new SqlCommand(CommandText, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            object ob = cmd.ExecuteScalar();
            con.Close();
            return ob;
        }
        public string[] getNameAndPhoto(String uid)
        {
            string cmd = "Select EmpName, EmpPic from Tbl_AddManager where EmpId='" + uid + "'";
            string[] arr = new string[2];
            DataTable dt = ExecuteSelect(cmd);
            if (dt.Rows.Count > 0)
            {
                arr[0] = dt.Rows[0][0].ToString();
                arr[1] = dt.Rows[0][1].ToString();
            }
            return arr;
        }
    }
}