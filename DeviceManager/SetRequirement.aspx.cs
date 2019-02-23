using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager
{
    public partial class SetRequirement : System.Web.UI.Page
    {
        DataClasses1DataContext DataClasses1DataContext = new DataClasses1DataContext();
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = "Admin";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nums = TextBox1.ToString();
            string dev = DropDownList3.ToString();

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            string selectcommand = "select 所属部门 from Admin where 用户名='" + Session["User"] + "'";
            SqlCommand myCommand = new SqlCommand(selectcommand, myConnection);
            string dep = (string)myCommand.ExecuteScalar();
            selectcommand = "select 供货商 from Contract where 交易资产='" + dev + "'";
            string sup= (string)myCommand.ExecuteScalar();
            selectcommand = "select 是否耗材 from Contract where 交易资产='" + dev + "'";
            string hao= (string)myCommand.ExecuteScalar();

            selectcommand = "insert into Requirement (需求内容,需求数量,供货商,需求部门,是否耗材) values ('" +
                dev + "','" + nums + "','" + sup + "','" + dep + "','" + hao+"'";


            myConnection.Close();



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}