using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeviceManager.App_Start
{
    public partial class Login : System.Web.UI.Page
    {
        private string connectionString = "Data Source=140.143.230.185;Initial Catalog=DeviceManager;Persist Security Info=True;User ID=sa;Password=huang@123456";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool Authenticated = false;
            Authenticated = ValidateLogin(Login1.UserName, Login1.Password);
            e.Authenticated = Authenticated;
            if (Authenticated == true)
            {
                Response.Redirect("Home.aspx");
            }
            
        }

        private bool ValidateLogin(string UserName, string Password)
        {
            bool result = false;

            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();
            string selectcommand = "select Count(*) from Admin where 用户名='" + UserName + "' and 密码='" + Password + "'"; ;
            SqlCommand myCommand = new SqlCommand(selectcommand, myConnection);
            int nums=(int)myCommand.ExecuteScalar();
            if (nums > 0)
            {
                result = true;
                Session["User"] = UserName;
            }
            
            return result;
        }

    }
}