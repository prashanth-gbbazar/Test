using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void btnsearch_Click(object sender, EventArgs e)
    //{
    //    if (txtid.Text != null && !string.IsNullOrEmpty(txtid.Text))
    //        Glib.LoadRequest("select * from notifications where userid='" + txtid.Text + "' order by id desc", gvsprovider);
    //    else
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter Contact Number',text: '',timer: 2000,showConfirmButton: false})", true);

    //}

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (txtid.Text != null && !string.IsNullOrEmpty(txtid.Text))
    //        Glib.LoadRequest("select * from starline_notifications where userid='" + txtid.Text + "' order by id desc", GridView1);
    //    else
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter Contact Number',text: '',timer: 2000,showConfirmButton: false})", true);

    //}
}