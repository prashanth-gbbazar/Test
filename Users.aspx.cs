using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;


public partial class UNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie myCookies = Request.Cookies["aauserid"];
            if (myCookies == null)
            {
                Response.Redirect("Login.aspx", false);
            }
            else
            {
            }
        }
    }
    //public void clear()
    //{
    //    tname.Text = tphone.Text = temail.Text = tusername.Text = tpassword.Text = tpoints.Text = "";
    //    btnAdd.Text = "Submit";
    //}
    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (tname.Text == "" || temail.Text == "" || tphone.Text == "" || tusername.Text == "" || tpassword.Text == "" || tpoints.Text == "")
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter Fileds',text: '',timer: 2000,showConfirmButton: false})", true);
    //            return;
    //        }
    //        else
    //        {
    //            SqlConnection con = new SqlConnection(Alib.conStr);
    //            SqlCommand cmd;
    //            con.Open();
    //            string sql = "insert into users (name,email,phone,username,password,points) values('" + tname.Text + "', '" + temail.Text + "','" + tphone.Text + "', '" + tusername.Text + "', '" + tpassword.Text + "', '" + tpoints.Text + "')";
    //            cmd = new SqlCommand(sql, con);
    //            int res;
    //            res = cmd.ExecuteNonQuery();
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Submitted',text: '',timer: 2000,showConfirmButton: false})", true);
    //            con.Close();
    //            gvsprovider.DataBind();
    //            clear();
    //            return;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}

    //protected void btnCancel_Click(object sender, EventArgs e)
    //{
    //    clear();
    //}

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        gvsprovider.Visible = false;
        gvsearch.Visible = true;
        if (txtid.Text != null && !string.IsNullOrEmpty(txtid.Text))
            Glib.LoadRequest("select * from users where phone like '" + txtid.Text + "%'", gvsearch);
        else
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'User Not Found',text: '',timer: 2000,showConfirmButton: false})", true);

    }
}



