using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Games : System.Web.UI.Page
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

    public void clear()
    {
        tname.Text = tawrds.Text = tplay.Text = "";
        dopen1.SelectedIndex = 0;
        dopen2.SelectedIndex = 0;
        dopen3.SelectedIndex = 0;
        dclose1.SelectedIndex = 0;
        dclose2.SelectedIndex = 0;
        dclose3.SelectedIndex = 0;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (tname.Text == "" || ddays.SelectedValue == "--" || dopen1.SelectedValue == "--" || dopen2.SelectedValue == "--" || dclose1.SelectedValue == "--" || dclose2.SelectedValue == "--")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter Fileds',text: '',timer: 2000,showConfirmButton: false})", true);
                return;
            }
            else
            {
                SqlConnection con = new SqlConnection(Alib.conStr);
                SqlCommand cmd;
                con.Open();
                string sql = "insert into maingames (name, opentime, closetime, days) values('" + tname.Text + "', '" + dopen1.SelectedValue + ":" + dopen2.SelectedValue + " " + dopen3.SelectedValue + "', '" + dclose1.SelectedValue + ":" + dclose2.SelectedValue + " " + dclose3.SelectedValue + "', '"+ddays.SelectedValue+"')";
                cmd = new SqlCommand(sql, con);
                int res;
                res = cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Submitted',text: '',timer: 2000,showConfirmButton: false})", true);
                con.Close();
                gvsprovider.DataBind();
                clear();
                return;
            }
        }
        catch (Exception ex)
        {
        }
    }


    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        try
        {
            if (tplay.Text == "" || tawrds.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter Fileds',text: '',timer: 2000,showConfirmButton: false})", true);
                return;
            }
            else
            {
                SqlConnection con = new SqlConnection(Alib.conStr);
                SqlCommand cmd;
                con.Open();
                string sql = "insert into plays (name, awardpoints) values('" + tplay.Text + "', '" + tawrds.Text + "')";
                cmd = new SqlCommand(sql, con);
                int res;
                res = cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Submitted',text: '',timer: 2000,showConfirmButton: false})", true);
                con.Close();
                GridView1.DataBind();
                clear();
                return;
            }
        }
        catch (Exception ex)
        {
        }
    }

}