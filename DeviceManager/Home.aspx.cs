using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager.App_Start
{
    public partial class Home : System.Web.UI.Page
    {
        //static string currentTable;
        static string currentControl;
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        string[] showTables = new string[] { "Role", "Admin", "Department" };
        string[] showColumns = new string[] { "职权", "用户名", "部门名称" };
        string[] showValues = new string[] { "职权", "用户名", "部门名称" };
        string[] g_authority = new string[] { "系统管理", "建立合同" ,"审核合同","院级需求建立","部门需求建立","订单提交",
        "入库单生成","质量检测","耗材盘点","资产新增","资产退出","资产转移","资产领用","资产维护","耗材领用" };
        DataClasses1DataContext DataClasses1DataContext = new DataClasses1DataContext();



        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["User"] = "admin";//调试时使用，获取全部权限
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
            if(myCommand.ExecuteScalar()==null)
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

        protected void Fresh()
        {
            DetailsView1.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = false;
            Button1.Visible = false;
            LinqDataSource1.Where = "";
            Label1.Visible = false;
            TextBox1.Visible = false;
            Button2.Visible = false;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Fresh(); //先初始化所有控件
            
            //供货商管理
            if(Menu1.Items[0].ChildItems[0].Selected)
            {
                if (!IdenValidate("系统管理"))
                {
                    Response.Write("<script>alert('你没有权限访问该页面')</script>");
                    return;
                }
                DetailsView1.Visible = true ;
                return;
            }
            //审核合同
            else if(Menu1.Items[0].ChildItems[1].Selected)
            {
                if(!IdenValidate("审核合同"))
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "click", "alert('你没有权限访问该页面')", true);
                    Response.Write("<script>alert('你没有权限访问该页面')</script>");
                    return;
                }
                LinqDataSource1.TableName = "Contract";
                LinqDataSource1.Where = "审核状态=\"否\"";
                GridView2.DataBind();
                GridView2.Visible = true;
                Button1.Text = "审核通过";
                Button1.Visible = true;
                currentControl = "审核";
                return;
            }
            //质量检测
            else if(Menu1.Items[3].Selected)
            {
                if (!IdenValidate("质量检测"))
                {
                    Response.Write("<script>alert('你没有权限访问该页面')</script>");

                }
                LinqDataSource1.TableName = "GodownEntry";
                LinqDataSource1.Where = "质检状态=0";
                GridView2.DataBind();
                GridView2.Visible = true;
                Button1.Text = "质检通过";
                Button1.Visible = true;
                currentControl = "质检";
                return;
            }
            //查询合同
            else if(Menu1.Items[0].ChildItems[2].Selected)
            {
                LinqDataSource1.TableName = "Contract";
                Label1.Text = "合同名称";
                Label1.Visible = true;
                TextBox1.Visible = true;
                Button2.Visible = true;
                currentControl = "合同查询";
            }
            //订单查询
            else if (Menu1.Items[1].ChildItems[0].Selected)
            {
                LinqDataSource1.TableName = "Order";
                Label1.Text = "订单名称";
                Label1.Visible = true;
                TextBox1.Visible = true;
                Button2.Visible = true;
                currentControl = "订单查询";
            }
            //订单统计
            else if (Menu1.Items[1].ChildItems[1].Selected)
            {
                LinqDataSource1.TableName = "OrderCount";
            }
            //入库单查询
            else if (Menu1.Items[2].ChildItems[0].Selected)
            {
                LinqDataSource1.TableName = "GodownEntry";
                Label1.Text = "入库资产";
                Label1.Visible = true;
                TextBox1.Visible = true;
                Button2.Visible = true;
                currentControl = "入库单查询";
            }
            //入库单统计
            else if (Menu1.Items[2].Selected)
            {
                LinqDataSource1.TableName = "GodownEntryCount";
            }
            GridView1.DataBind();
            GridView1.Visible = true;

        }

        //通过合同或者通过质检
        //取决于currentControl;
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string table;
            string status;
            string zinfo;
            string xinfo="通过内容如下：";
            
            if (currentControl == "审核")
            {
                table = "Contract";
                status = "审核状态";
                zinfo = "一项合同审核通过";
            }
            else
            {
                table = "GodownEntry";
                status = "质检状态";
                zinfo = "一单入库资产质检通过";
            }

            bool anything = false;//判断有行被选中
            string sqlText = "(";
            foreach (GridViewRow objGVR in this.GridView2.Rows)
            {
                //判断当前行是否为数据行;
                if (objGVR.RowType == DataControlRowType.DataRow)
                {
                    CheckBox objCB = objGVR.FindControl("cbxId") as CheckBox;

                    if (objCB.Checked)
                    {
                        //获取选中行的主键;
                        sqlText += this.GridView2.DataKeys[objGVR.RowIndex]["id"].ToString() + ",";
                        anything = true;
                        if (currentControl == "审核")
                        {
                            xinfo+= this.GridView2.DataKeys[objGVR.RowIndex]["合同名"].ToString() + ",";
                        }
                        else
                        {
                            xinfo += this.GridView2.DataKeys[objGVR.RowIndex]["资产名称"].ToString() + ",";
                        }
                    }
                }
            }
            if (!anything)
                return;
            //去掉最后的逗号，并且加上右括号 ,如果不去掉最后一个逗号变会成这样(1,2,3,4,5,6,)
            sqlText = sqlText.Substring(0, sqlText.Length - 1) + ")";
            xinfo= xinfo.Substring(0, xinfo.Length - 1) + ")";

            sqlText = "update "+table+" set "+status+"='是' where id in" + sqlText;


            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();

            string sqlinfo = "insert into Bulletin (消息种类,详细信息) values ('" + zinfo + "','" + xinfo + "')";
            myCommand.ExecuteNonQuery();
            LinqDataSource1.TableName = table;
            LinqDataSource1.Where = status+"=\"否\"";
            GridView2.DataBind();
            myConnection.Close();

        }

        //搜索按钮
        protected void Button2_Click(object sender, EventArgs e)
        {
            string condition="";
            if (currentControl == "订单查询")
            {
                LinqDataSource1.TableName = "Order";
                condition="资产名称=\"" + TextBox1.Text.ToString() + "\"";
                //condition = "资产名称 like '%" + TextBox1.Text.ToString() + "%'";
            }

            else if (currentControl == "合同查询")
            {
                LinqDataSource1.TableName = "Contract";
                condition = "交易资产=\"" + TextBox1.Text.ToString() + "\"";
                //condition = "交易资产 like '%" + TextBox1.Text.ToString() + "%'";
            }

            else if (currentControl == "入库单查询")
            {
                LinqDataSource1.TableName = "GodownEntry";
                condition = "资产名称='" + TextBox1.Text.ToString() + "'";
                //condition = "资产名称 like '%" + TextBox1.Text.ToString() + "%'";
            }
            LinqDataSource1.Where = condition;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserManager.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["User"] = "";
            Server.Transfer("Login.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Setinfo.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetContract.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetRequirement.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetOrder.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetGoDownEntry.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("info.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("HaoManager.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeviceManage.aspx");
        }
    }
}