using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager
{
    public partial class SetOrder : System.Web.UI.Page
    {
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {


            bool anything = false;//判断有行被选中
            string sqlText = "('";
            foreach (GridViewRow objGVR in this.GridView2.Rows)
            {
                //判断当前行是否为数据行;
                if (objGVR.RowType == DataControlRowType.DataRow)
                {
                    CheckBox objCB = objGVR.FindControl("cbxId") as CheckBox;

                    if (objCB.Checked)
                    {
                        //获取选中行的主键;
                        sqlText += this.GridView2.DataKeys[objGVR.RowIndex]["需求资产"].ToString() + "','";
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

            GridView2.DataBind();
            myConnection.Close();
        }
    }
}