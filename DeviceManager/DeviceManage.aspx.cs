using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager
{
    public partial class DeviceManage : System.Web.UI.Page
    {
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //领用
        protected void Button4_Click(object sender, EventArgs e)
        {

        }
        //退出
        protected void Button3_Click(object sender, EventArgs e)
        {

        }
        //借出
        protected void Button8_Click(object sender, EventArgs e)
        {

        }
        //归还
        protected void Button7_Click(object sender, EventArgs e)
        {

        }
        //产权变更
        protected void Button5_Click(object sender, EventArgs e)
        {

        }
        //维修
        protected void Button2_Click(object sender, EventArgs e)
        {

        }
        //折旧
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool anything = false;//判断有行被选中
            string sqlText = "('";
            foreach (GridViewRow objGVR in this.GridView1.Rows)
            {
                //判断当前行是否为数据行;
                if (objGVR.RowType == DataControlRowType.DataRow)
                {
                    CheckBox objCB = objGVR.FindControl("cbxId") as CheckBox;

                    if (objCB.Checked)
                    {
                        //获取选中行的主键;
                        sqlText += this.GridView1.DataKeys[objGVR.RowIndex]["id"].ToString() + "','";
                        anything = true;
                    }
                }
            }
            if (!anything)
                return;
            //去掉最后的逗号，并且加上右括号 ,如果不去掉最后一个逗号变会成这样(1,2,3,4,5,6,)
            sqlText = sqlText.Substring(0, sqlText.Length - 2) + ")";

            sqlText = "update Requirement set 订单生成='是' where 需求资产 in" + sqlText;

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();
            GridView1.DataBind();
            myConnection.Close();
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            GridView1.Visible = false;
            DetailsView1.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            Button8.Visible = false;
            Button7.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;

            if (Menu1.Items[0].Selected)
            {
                DetailsView1.Visible = true;
                return;
            }
            else if (Menu1.Items[1].Selected)
            {
                Label1.Visible = true;
                DropDownList1.Visible = true;
                Button3.Visible = true;
            }
            else if(Menu1.Items[2].Selected)
            {
                Button1.Visible = true;
                Button2.Visible = true;
            }
            else if (Menu1.Items[3].Selected)
            {
                Button4.Visible = true;
                Label2.Visible = true;
                DropDownList2.Visible = true;
                Button5.Visible = true;
                Button8.Visible = true;
                Button7.Visible = true;

            }
            GridView1.DataBind();
            GridView1.Visible = true;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}