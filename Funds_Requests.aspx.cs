using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Funds_Requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Glib.LoadRequest("select * from [pointsRequest] order by id desc", gvsprovider);
            Glib.LoadRequest("select * from [pointsAdd] order by id desc", GridView1);
        }
    }

    protected void gvsprovider_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvsprovider.PageIndex = e.NewPageIndex;
        Glib.LoadRequest("select * from [pointsRequest] order by id desc", gvsprovider);
    }
    protected void gvsprovider_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Del"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow rows = gvsprovider.Rows[index];
                string id = HttpUtility.HtmlDecode(rows.Cells[2].Text).ToString();
                string state = HttpUtility.HtmlDecode(rows.Cells[6].Text).ToString();
                lblid.Text = id;
                if (state == "Waiting")
                {
                    Alib.idExecute("update pointsRequest set state='Deleted' where id=" + id);
                    Glib.LoadRequest("select * from [pointsRequest] order by id desc", gvsprovider);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Deleted',text: '',timer: 2000,showConfirmButton: false})", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'You Cannot Delete',text: '',timer: 2000,showConfirmButton: false})", true);
                }

            }
            if (e.CommandName.Equals("edi"))
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow rows = gvsprovider.Rows[index];
                    string id = HttpUtility.HtmlDecode(rows.Cells[2].Text).ToString();
                    string state = HttpUtility.HtmlDecode(rows.Cells[6].Text).ToString();
                    lblid.Text = id;
                    if (state == "Waiting")
                    {
                        Alib.idExecute("update users set withdrawstatus='Completed' where phone='" + HttpUtility.HtmlDecode(rows.Cells[3].Text).ToString() + "'");
                        Alib.idExecute("update pointsRequest set state='Completed' where id=" + id);
                        Glib.LoadRequest("select * from [pointsRequest] order by id desc", gvsprovider);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Withdrawn',text: '',timer: 2000,showConfirmButton: false})", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'You Cannot Withdraw',text: '',timer: 2000,showConfirmButton: false})", true);
                    }

                }
                catch (Exception ex)
                {
                }
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Glib.LoadRequest("select * from [pointsAdd] order by id desc", GridView1);
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Del"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow rows = GridView1.Rows[index];
                string id = HttpUtility.HtmlDecode(rows.Cells[2].Text).ToString();
                string state = HttpUtility.HtmlDecode(rows.Cells[6].Text).ToString();
                lblid.Text = id;
                if (state == "Waiting")
                {
                    Alib.idExecute("update pointsAdd set state='Deleted' where id=" + id);
                    Glib.LoadRequest("select * from [pointsAdd] order by id desc", GridView1);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Deleted',text: '',timer: 2000,showConfirmButton: false})", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'You Cannot Delete',text: '',timer: 2000,showConfirmButton: false})", true);
                }

            }
            if (e.CommandName.Equals("edi"))
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow rows = GridView1.Rows[index];
                    string id = HttpUtility.HtmlDecode(rows.Cells[2].Text).ToString();
                    string state = HttpUtility.HtmlDecode(rows.Cells[6].Text).ToString();
                    lblid.Text = id;
                    if (state=="Waiting")
                    {
                        Alib.idExecute("update users set points=convert(int,points)+'" + HttpUtility.HtmlDecode(rows.Cells[4].Text).ToString() + "', lastpoints='" + HttpUtility.HtmlDecode(rows.Cells[4].Text).ToString() + "', addpointsstatus='Completed' where phone='" + HttpUtility.HtmlDecode(rows.Cells[3].Text).ToString() + "'");
                        Alib.idExecute("update pointsAdd set state='Completed' where id=" + id);
                        Glib.LoadRequest("select * from [pointsAdd] order by id desc", GridView1);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Added',text: '',timer: 2000,showConfirmButton: false})", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'You Cannot Add',text: '',timer: 2000,showConfirmButton: false})", true);
                    }

                }
                catch (Exception ex)
                {
                }
            }

        }
        catch (Exception ex)
        {
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string state = e.Row.Cells[6].Text.ToString();

            foreach (TableCell cell in e.Row.Cells)
            {
                if (state == "Completed")
                {
                    cell.BackColor = Color.Red;
                    cell.ForeColor = Color.White;
                }
                if (state == "Waiting")
                {
                    cell.BackColor = Color.Green;
                    cell.ForeColor = Color.White;
                }
                if (state == "Deleted")
                {
                    cell.BackColor = Color.Gray;
                    cell.ForeColor = Color.White;
                }
            }
        }
    }

    protected void gvsprovider_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string state = e.Row.Cells[6].Text.ToString();

            foreach (TableCell cell in e.Row.Cells)
            {
                if (state == "Completed")
                {
                    cell.BackColor = Color.Red;
                    cell.ForeColor = Color.White;
                }
                if (state == "Waiting")
                {
                    cell.BackColor = Color.Green;
                    cell.ForeColor = Color.White;
                }
                if (state == "Deleted")
                {
                    cell.BackColor = Color.Gray;
                    cell.ForeColor = Color.White;
                }
            }
        }
    }
}