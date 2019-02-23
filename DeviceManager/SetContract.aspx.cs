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
   
    public partial class SetContract : System.Web.UI.Page
    {
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = "admin";//调试时使用，获取全部权限
            if (IdenValidate("建立合同") == false)
            {
                Response.Write("<script>alert('你没有权限访问该页面');history.go(-1)</script>");
            }
        }

        //身份与权限验证
        public bool IdenValidate(string choose)
        {
            bool result = false;
            if (Session["User"] == null)
                return result;
            string user = Session["User"].ToString();

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            string selectcommand = "select roleid from User2Role where userid=(select id from Admin where 用户名='" + user + "')";
            SqlCommand myCommand = new SqlCommand(selectcommand, myConnection);
            if (myCommand.ExecuteScalar() == null)
            {
                return result;
            }
            int roleid = (int)myCommand.ExecuteScalar();
            selectcommand = "select 权限 from Authority where id in (select authid from Role2Auth where roleid='" + roleid + "')";
            myCommand = new SqlCommand(selectcommand, myConnection);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = myCommand;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow row in dt.Rows)
            {
                if (row[0].ToString() == choose)
                {
                    result = true;
                    break;
                }
            }
            myConnection.Close();
            return result;
        }

        //生成合同
        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string dev = TextBox2.Text;
            string stime = TextBox3.Text;
            string ztime = TextBox4.Text;
            string sup = DropDownList1.Text;
            string hao = DropDownList2.Text;

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            string selectcommand = "insert into Contract (合同名,交易资产,生效时间,终止时间,供货商,是否耗材) values ('"
                + name + "','" + dev + "','" + stime + "','" + ztime + "','" + sup + "','" + hao + "')";
            SqlCommand myCommand = new SqlCommand(selectcommand, myConnection);
            int result = myCommand.ExecuteNonQuery();
            if (result > 0)
                Response.Write("<script>alert('添加合同成功，请等待审核')</script>");
            else
                Response.Write("<script>alert('执行失败，请检查输入数据')</script>");
            myConnection.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}