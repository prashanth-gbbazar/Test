using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class udownloads : System.Web.UI.Page
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
            databind();
        }
    }
    public void databind()
    {
        string qur = "Select * from Sarkara_Downloads order by Sno desc";
        try
        {
            gvsprovider.DataSource = Alib.getData(qur);
            gvsprovider.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvsprovider_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvsprovider.PageIndex = e.NewPageIndex;
        databind();
    }
}