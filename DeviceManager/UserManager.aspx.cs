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
    public partial class UserManager : System.Web.UI.Page
    {
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        //static string currentTable;
        static string currentControl;
        static string chooseid;//选择的用户或者角色id值

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

        protected void Page_Load(object sender, EventArgs e)
        {

            //Session["User"] = "admin";//调试时使用，获取全部权限
            if((IdenValidate("系统管理")||IdenValidate("部门管理"))==false)
            {
                Response.Write("<script>alert('你没有权限访问该页面');history.go(-1)</script>");
            }

        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            LinqDataSource1.Where = "";
            GridView3.Visible = true;
            DetailsView1.Visible = false;
            Button1.Visible=false;
            GridView4.Visible = false;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            GridView4.Visible = false;
            GridView3.Visible = false;
            DetailsView1.Visible = false;
            DetailsView2.Visible = false;
            GridView2.Visible = false;
         //   Button1.Visible = false;
            Button2.Visible = false;
            LinqDataSource1.Where = "";
            currentControl = "";

            if (Menu1.Items[0].ChildItems[0].Selected)
            {
                LinqDataSource1.TableName = "Admin";
                GridView3.DataBind();
                GridView3.Visible = true;
            }
            else if (Menu1.Items[1].ChildItems[0].Selected)
            {
                currentControl = "SetRole";
                LinqDataSource1.TableName = "Role";
                GridView3.DataBind();
                GridView3.Visible = true;
            }
            else if(Menu1.Items[2].Selected)
            {
                DetailsView2.Visible = true;
            }

            //为用户选择角色
            else if (Menu1.Items[0].ChildItems[1].Selected)
            {
                Button2.Text = "赋予角色";
                GridView3.DataSourceID = "LinqDataSource1";
                DetailsView1.DataSourceID = "LinqDataSource1";
                GridView3.DataBind();
                GridView3.Visible = true;
                currentControl = "用户角色";
            }

            //为角色选择权限
            else if (Menu1.Items[1].ChildItems[1].Selected)
            {
                Button2.Text = "赋予权限";
                GridView3.DataSourceID = "LinqDataSource2";
                DetailsView1.DataSourceID = "LinqDataSource2";
                GridView3.DataBind();
                GridView3.Visible = true;
                currentControl = "角色权限";
            }
        }

        //设置用户角色或者角色权限
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            string table;
            string fid;//目标id列名
            string sid;//次目标id列名
            if (currentControl == "用户角色")
            {
                table = "User2Role";
                fid = "userid";
                sid = "roleid";
            }
            else
            {
                table = "Role2User";
                fid = "roleid";
                sid = "authid";
            }

            Response.Write("<script>alert('赋予成功')</script>");
            return;
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
                        sqlText += chooseid+","+this.GridView2.DataKeys[objGVR.RowIndex]["ID"].ToString() + "),(";
                        anything = true;
                    }
                }
            }
            if (!anything)
                return;
            //去掉最后的逗号括号
            sqlText = sqlText.Substring(0, sqlText.Length - 2);

            sqlText = "delete from " + table + "where " + fid + "=" + chooseid + ";insert into " + 
                table + " (" + fid + "," + sid + ") values " + sqlText;

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();

        }



        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            string WareName = ((TextBox)this.DetailsView2.FindControl("TextBox1")).Text.Trim();
            string DeName = ((TextBox)this.DetailsView2.FindControl("TextBox2")).Text.Trim();
            string sqlText = "insert into Warehouse (仓库名,仓库所属) values ('" + WareName + "','" + DeName + "')";

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();
        }

        protected void DetailsView2_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string WareName = ((TextBox)this.DetailsView2.FindControl("部门库")).Text.Trim();
            string DeName = ((TextBox)this.DetailsView2.FindControl("TextBox2")).Text.Trim();
            //如果是空改成有二级库则插入，否则则更改仓库表

            string sqlText = "if exists (select * from Warehouse where 仓库所属='" + DeName + "') " +
                "update Warehouse set 仓库名=" + WareName + "' where 仓库所属='" + DeName + "' " +
                "else insert into Warehouse (仓库名,仓库所属) values ('" + WareName + "','" + DeName + "')";

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(sqlText, myConnection);
            myCommand.ExecuteNonQuery();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView3.Visible = false;
            Button2.Visible = false;
            int index = int.Parse(e.CommandArgument.ToString());
            string id = GridView3.Rows[index].Cells[1].Text;

            if (e.CommandName == "info")
            {
                //如果是设置角色或者权限
                if (currentControl == "用户角色")
                {
                    chooseid = id;
                    LinqDataSource2.TableName = "Role";
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    Button2.Visible = true;
                    //DropDownList1.DataBind();
                    //DropDownList1.Visible = true;
                }
                else if(currentControl == "角色权限")
                {
                    chooseid = id;
                    LinqDataSource2.TableName = "Authority";
                    GridView4.Visible = true;
                    Button2.Visible = true;
                }
                //编辑信息
                else
                {
                    if (currentControl == "SetRole")
                        LinqDataSource1.TableName = "Role";
                    LinqDataSource1.Where = "id=" + id;
                    DetailsView1.DataBind();
                    DetailsView1.Visible = true;
                    Button1.Visible = true;
                    
                    //需要设置ID列不可编辑
                }
            }
        }
    }
}