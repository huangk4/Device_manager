using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager
{
    public partial class SetGoDownEntry : System.Web.UI.Page
    {
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string name = TextBox1.Text.ToString();
            string nums = TextBox2.Text.ToString();
            string hao = DropDownList2.Text.ToString();
            string ware = DropDownList3.Text.ToString();
            string sqlText = "insert into Device (资产名称,所属仓库,存量,是否耗材) values ('"
                +name+"','"+ware+"','"+nums+"','"+hao+"')";
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();
            sqlText= "insert into GodownEntry (资产名称,入库库名,入库数量,是否耗材) values ('"
                + name + "','" + ware + "','" + nums + "','" + hao + "')";
            myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('入库单建立成功，请等待质检')</script>");
            return;
        }
    }
}