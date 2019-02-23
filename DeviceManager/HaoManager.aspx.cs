using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager
{
    public partial class HaoManager : System.Web.UI.Page
    {
        
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = "Admin";//测试
            //根据用户SESSION获取用户所能访问的库
            string user = Session["User"].ToString();
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            string selectcommand = "select 部门库 from Department where 部门名称=(select 所属部门 from Admin where 用户名='" + user + "')";
            SqlCommand myCommand = new SqlCommand(selectcommand, myConnection);
            Session["Warehouse"] = myCommand.ExecuteScalar().ToString();
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string dev = DropDownList1.SelectedValue;
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            string selectcommand = "select 存量 from Device where 资产名称='" + dev + "'";
            SqlCommand myCommand = new SqlCommand(selectcommand, myConnection);
            string t_num = myCommand.ExecuteScalar().ToString();
            Label3.Text = t_num;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}