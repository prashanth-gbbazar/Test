using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Settings : System.Web.UI.Page
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
            getpasscode();
        }
    }
    public void getpasscode()
    {
        txtun.Text = Alib.getSingleValue("select username from login");
        txtpw.Text = Alib.getSingleValue("select password from login");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Alib.idExecute("Update login set username='" + txtun.Text + "', password='" + txtpw.Text + "'");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Details Updated',text: '',timer: 2000,showConfirmButton: false})", true);
        getpasscode();
    }
}