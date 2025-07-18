using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie myCookies = Request.Cookies["aauserid"];
            if (myCookies != null)
            {
                myCookies.Expires = DateTime.Now.AddHours(12).AddMinutes(30).AddHours(-1);
            }
        }
    }
    protected void go_ServerClick(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        if (email.Value == "")
        {
            lblError.Visible = true;
            lblError.Text = "Enter Username";
            email.Focus();
            return;
        }
        if (password.Value == "")
        {
            lblError.Visible = true;
            lblError.Text = "Enter Password";
            password.Focus();
            return;
        }
        string qur = "select * from login where username=@user and password=@pass";
        try
        {
            using (conn = new SqlConnection(Alib.conStr))
            {
                SqlCommand cmd = new SqlCommand(qur, conn);
                cmd.Parameters.Add(new SqlParameter("@user", email.Value));
                cmd.Parameters.Add(new SqlParameter("@pass", password.Value));
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        reader.Read();
                        Session["name"] = reader["username"].ToString();
                        HttpCookie cookie = new HttpCookie("aauserid");
                        cookie.Value = reader["id"].ToString();
                        cookie.Expires = DateTime.Now.AddHours(12).AddMinutes(30).AddHours(1);
                        Response.Cookies.Add(cookie);
                        lblError.Visible = false;
                        
                        Response.Redirect("Dashboard.aspx");
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        lblError.Visible = true;
                        lblError.Text = "Invalid Username or Password!";
                        return;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
        finally
        {
            if (conn != null)
                conn.Dispose();
        }
    }
}