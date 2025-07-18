using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                gameBind();
                playBind();
                tdate.Text = System.DateTime.Now.AddHours(12).AddMinutes(30).ToString("dd/MM/yyyy");
                Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) order by id desc", GridView1);
                pointCount();
                recordCount();
                userCount();
            }
            catch (Exception ex)
            {

            }
        }
    }

    public void userCount()
    {
        try
        {
            tusers.InnerText = "0";
            var distinctRows = (from GridViewRow row in GridView1.Rows
                                select row.Cells[1].Text
                    ).Distinct().Count();
            tusers.InnerText = distinctRows.ToString();
        }
        catch (Exception ex)
        {

        }
        finally
        {

        }
    }
    public void recordCount()
    {
        try
        {
            tgames.InnerText = "0";
            tgames.InnerText = GridView1.Rows.Count.ToString();
        }
        catch (Exception ex)
        {

        }
    }

    public void pointCount()
    {
        try
        {
            decimal a = 0, c = 0;
            tpoints.InnerText = "0";
            for (int i = 0; i < (GridView1.Rows.Count); i++)
            {
                a = Convert.ToDecimal(GridView1.Rows[i].Cells[8].Text.ToString());
                c = c + a;
                tpoints.InnerText = c.ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }
    public void gameBind()
    {
        try
        {
            string qur = "select * from maingames";
            if (Alib.idHasRows(qur))
            {
                SqlConnection con = new SqlConnection(Alib.conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand(qur, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dgame.DataSource = ds;
                dgame.DataTextField = "name";
                dgame.DataValueField = "gameid";
                dgame.DataBind();
                dgame.Items.Insert(0, new ListItem("Select", "0"));
                con.Close();
            }
        }
        catch (Exception ex)
        {
        }
    }

    public void playBind()
    {
        try
        {
            string qur = "select * from plays";
            if (Alib.idHasRows(qur))
            {
                SqlConnection con = new SqlConnection(Alib.conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand(qur, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dplay.DataSource = ds;
                dplay.DataTextField = "name";
                dplay.DataValueField = "playids";
                dplay.DataBind();
                dplay.Items.Insert(0, new ListItem("Select", "0"));
                con.Close();
            }
        }
        catch (Exception ex)
        {
        }
    }

    public void dataBind()
    {
        try
        {
            //  
            if ((tdate.Text != "" || tdate.Text != "Enter Date") && (dgame.SelectedItem.Text == "Select") && (dplay.SelectedItem.Text == "Select"))
            {
                Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) order by id desc", GridView1);
            }

            //  
            else if ((tdate.Text != "" || tdate.Text != "Enter Date") && (dgame.SelectedItem.Text != "Select") && (dplay.SelectedItem.Text == "Select"))
            {
                Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and gameid ='" + dgame.SelectedValue + "' order by id desc", GridView1);
            }

            //  
            else if ((tdate.Text != "" || tdate.Text != "Enter Date") && (dgame.SelectedItem.Text == "Select") && (dplay.SelectedItem.Text != "Select"))
            {
                Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and playid like '" + dplay.SelectedValue + "%' order by id desc", GridView1);
            }

            //  
            else if ((tdate.Text != "" || tdate.Text != "Enter Date") && (dgame.SelectedItem.Text != "Select") && (dplay.SelectedItem.Text != "Select"))
            {
                string selectedPlay = "";
                if (dplay.SelectedValue == "SPNO" || dplay.SelectedValue == "SPNC")
                {
                    selectedPlay = "SPN";
                    Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and playid = '" + selectedPlay + "' and gameid = '" + dgame.SelectedValue + "' order by id desc", GridView1);
                }
                else if (dplay.SelectedValue == "SDO" || dplay.SelectedValue == "SDC")
                {
                    selectedPlay = "SD";
                    Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and playid = '" + selectedPlay + "' and gameid = '" + dgame.SelectedValue + "' order by id desc", GridView1);
                }
                else
                {
                    Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and playid = '" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' order by id desc", GridView1);
                }
            }
        }
        catch (Exception ex)
        {
        }
    }

    public void winner()
    {
        if (string.IsNullOrEmpty(tdate.Text) || dplay.SelectedItem.Text == "Select" || dgame.SelectedItem.Text == "Select")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Select Date & Game & Play',text: '',timer: 2500,showConfirmButton: false})", true);
        }
        else
        {
            SqlConnection conn = null;
            conn = new SqlConnection(Alib.conStr);
            SqlCommand cmd = null;
            SqlDataReader reader = null;
            try
            {

                if ((tdate.Text != "" || tdate.Text != "Enter Date") && (dgame.SelectedItem.Text != "Select") && (dplay.SelectedItem.Text != "Select"))
                {
                    string singleDigit = lbldigit.InnerText.Substring(0, 1);
                    string closeDigit = lbldigit.InnerText.Substring(1);

                    if (dplay.SelectedValue == "SPNO")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playids = 'SPNO' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SPN' and gameid = '" + dgame.SelectedValue + "' and gametype = 'Open' and number = '" + lblopen.InnerText + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SPNC")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playids = 'SPNC' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SPN' and gameid = '" + dgame.SelectedValue + "' and gametype = 'Close' and number = '" + lblclose.InnerText + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SDO")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playids = 'SDO' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SD' and gameid = '" + dgame.SelectedValue + "' and digit = '" + singleDigit + "' and gametype = 'Open'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SDC")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playids = 'SDC' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SD' and gameid = '" + dgame.SelectedValue + "' and digit = '" + closeDigit + "' and gametype = 'Close'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "FS")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and number = '" + lblopen.InnerText + "' and number2 = '" + lblclose.InnerText + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "JD")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and digit = '" + lbldigit.InnerHtml + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "HS")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and (number = '" + lblopen.InnerText + "' and digit = '" + closeDigit + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and digit = '" + singleDigit + "' and gametype = 'Close')", gvwinner);
                    }
                    else if (dplay.SelectedValue == "DPN")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and (number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number2 = '" + lblclose.InnerText + "' and gametype = 'Close')", gvwinner);
                    }
                    else if (dplay.SelectedValue == "TPN")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and (number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number2 = '" + lblclose.InnerText + "' and gametype = 'Close')", gvwinner);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
        }
    }

    protected void btnCal_Click(object sender, EventArgs e) //single digit - sd //open panna - op //close panna - cp //half sangam - hs //double digit - dd
    {                                                       //triple panna - tp //double panna - dp //close digit - cd //full sangam - fs
        if (string.IsNullOrEmpty(tdate.Text) || dplay.SelectedItem.Text == "Select" || dgame.SelectedItem.Text == "Select")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Select Date & Game & Play',text: '',timer: 2500,showConfirmButton: false})", true);
        }
        else
        {
            SqlConnection conn = null;
            conn = new SqlConnection(Alib.conStr);
            SqlCommand cmd = null;
            SqlDataReader reader = null;
            try
            {

                if ((tdate.Text != "" || tdate.Text != "Enter Date") && (dgame.SelectedItem.Text != "Select") && (dplay.SelectedItem.Text != "Select"))
                {
                    string singleDigit = lbldigit.InnerText.Substring(0, 1);
                    string closeDigit = lbldigit.InnerText.Substring(1);

                    if (dplay.SelectedValue == "SPNO")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playids = 'SPNO' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SPN' and gameid = '" + dgame.SelectedValue + "' and gametype = 'Open' and number = '" + lblopen.InnerText + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SPNC")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playids = 'SPNC' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SPN' and gameid = '" + dgame.SelectedValue + "' and gametype = 'Close' and number = '" + lblclose.InnerText + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SDO")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playids = 'SDO' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SD' and gameid = '" + dgame.SelectedValue + "' and digit = '" + singleDigit + "' and gametype = 'Open'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SDC")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playids = 'SDC' where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='SD' and gameid = '" + dgame.SelectedValue + "' and digit = '" + closeDigit + "' and gametype = 'Close'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "FS")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and number = '" + lblopen.InnerText + "' and number2 = '" + lblclose.InnerText + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "JD")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and digit = '" + lbldigit.InnerHtml + "'", gvwinner);
                    }
                    else if (dplay.SelectedValue == "HS")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and ((number = '" + lblopen.InnerText + "' and digit = '" + closeDigit + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and digit = '" + singleDigit + "' and gametype = 'Close'))", gvwinner);
                    }
                    else if (dplay.SelectedValue == "DPN")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and ((number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and gametype = 'Close'))", gvwinner);
                    }
                    else if (dplay.SelectedValue == "TPN")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and ((number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and gametype = 'Close'))", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SP")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and ((number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and gametype = 'Close'))", gvwinner);
                    }
                    else if (dplay.SelectedValue == "DP")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and ((number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and gametype = 'Close'))", gvwinner);
                    }
                    else if (dplay.SelectedValue == "SPDPTP")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.gametype as Type, g.number as Number1, g.number2 as Number2, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and ((number = '" + lblopen.InnerText + "' and gametype = 'Open') or (number = '" + lblclose.InnerText + "' and gametype = 'Close'))", gvwinner);
                    }
                    else if (dplay.SelectedValue == "RB")
                    {
                        Glib.LoadRequest("select g.id as Id, g.username as [User Name], g.gameid as Game, g.playid as Play, g.digit as Digit, g.points as Points, p.awardpoints as Awards, (convert(float,g.points)* convert(float,p.awardpoints)) as [Win Points], g.date as Date, g.inserteddate as Entry from gamedata g join plays p on p.playid = g.playid where convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) and g.playid ='" + dplay.SelectedValue + "' and gameid = '" + dgame.SelectedValue + "' and digit = '" + lbldigit.InnerHtml + "'", gvwinner);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
        }
    }

    protected void dgame_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        conn = new SqlConnection(Alib.conStr);
        SqlCommand cmd = null;
        SqlDataReader reader = null;
        try
        {
            string qur = "select top(1) * from numbers where gameid = '" + dgame.SelectedValue + "' and convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) order by id desc";
            cmd = new SqlCommand(qur, conn);
            conn.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lblopen.InnerText = reader["opennumber"].ToString();
                    lbldigit.InnerText = reader["digit"].ToString();
                    lblclose.InnerText = reader["closenumber"].ToString();
                }
            }
            else
            {
                lblopen.InnerText = "0";
                lbldigit.InnerText = "0";
                lblclose.InnerText = "0";
            }
            dataBind();
            pointCount();
            recordCount();
            userCount();
            // winner();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
    }

    protected void dplay_SelectedIndexChanged(object sender, EventArgs e)
    {
        dataBind();
        pointCount();
        recordCount();
        userCount();
        // winner();
    }

    protected void tdate_TextChanged(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        conn = new SqlConnection(Alib.conStr);
        SqlCommand cmd = null;
        SqlDataReader reader = null;
        try
        {
            cmd = new SqlCommand("select top(1) * from numbers where gameid='" + dgame.SelectedValue + "' and convert(datetime, date, 103) = convert(datetime, '" + tdate.Text + "', 103) order by id desc", conn);
            conn.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lblopen.InnerText = reader["opennumber"].ToString();
                    lbldigit.InnerText = reader["digit"].ToString();
                    lblclose.InnerText = reader["closenumber"].ToString();
                }
            }
            else
            {
                lblopen.InnerText = "0";
                lbldigit.InnerText = "0";
                lblclose.InnerText = "0";
            }
            dataBind();
            pointCount();
            recordCount();
            userCount();
            // winner();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        if (txtid.Text != null && !string.IsNullOrEmpty(txtid.Text))
            Glib.LoadRequest("select id as Id, username as [User Name], gameid as Game, playid as Play, gametype as Type, number as Number1, number2 as Number2, digit as Digit, points as Points, date as Date, inserteddate as Entry from gamedata where Username='" + txtid.Text + "' OR Id = '" + txtid.Text + "' order by id desc", GridView1);
        else
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter ID or Username',text: '',timer: 2000,showConfirmButton: false})", true);

    }

    protected void btnwlt_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow g1 in gvwinner.Rows)
        {
            if (!Alib.idHasRows("SELECT gamedataId FROM winners WHERE gamedataId='" + g1.Cells[0].Text + "' "))
            {
                if (dplay.SelectedValue == "SPNO" || dplay.SelectedValue == "SPNC")
                {
                    Alib.idExecute("Insert into winners(gamedataId,Username,Game,Play,Type,Number1,Points,Rewards,WinPoints,Date,Inserted,userEntry,playid) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + dgame.SelectedItem.Text + "','" + dplay.SelectedItem.Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + g1.Cells[6].Text + "','" + g1.Cells[7].Text + "','" + g1.Cells[8].Text + "','" + g1.Cells[9].Text + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "','" + g1.Cells[10].Text + "','" + g1.Cells[3].Text + "' )");
                    Alib.idExecute("update users set points=convert(int,points)+'" + g1.Cells[8].Text + "', lastwinpoints='" + g1.Cells[8].Text + "' where phone='" + g1.Cells[1].Text + "'");
                    sendList(g1.Cells[1].Text, dgame.SelectedItem.Text, dplay.SelectedItem.Text, g1.Cells[8].Text, g1.Cells[9].Text);
                }
                if (dplay.SelectedValue == "SDO" || dplay.SelectedValue == "SDC")
                {
                    Alib.idExecute("Insert into winners(gamedataId,Username,Game,Play,Type,Digit,Points,Rewards,WinPoints,Date,Inserted,userEntry,playid) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + dgame.SelectedItem.Text + "','" + dplay.SelectedItem.Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + g1.Cells[6].Text + "','" + g1.Cells[7].Text + "','" + g1.Cells[8].Text + "','" + g1.Cells[9].Text + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "','" + g1.Cells[10].Text + "','" + g1.Cells[3].Text + "')");
                    Alib.idExecute("update users set points=convert(int,points)+'" + g1.Cells[8].Text + "', lastwinpoints='" + g1.Cells[8].Text + "' where phone='" + g1.Cells[1].Text + "'");
                    sendList(g1.Cells[1].Text, dgame.SelectedItem.Text, dplay.SelectedItem.Text, g1.Cells[8].Text, g1.Cells[9].Text);
                }
                if (dplay.SelectedValue == "JD" || dplay.SelectedValue == "RB")
                {
                    Alib.idExecute("Insert into winners(gamedataId,Username,Game,Play,Digit,Points,Rewards,WinPoints,Date,Inserted,userEntry,playid) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + dgame.SelectedItem.Text + "','" + dplay.SelectedItem.Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + g1.Cells[6].Text + "','" + g1.Cells[7].Text + "','" + g1.Cells[8].Text + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "','" + g1.Cells[9].Text + "','" + g1.Cells[3].Text + "')");
                    Alib.idExecute("update users set points=convert(int,points)+'" + g1.Cells[7].Text + "', lastwinpoints='" + g1.Cells[7].Text + "' where phone='" + g1.Cells[1].Text + "'");
                    sendList(g1.Cells[1].Text, dgame.SelectedItem.Text, dplay.SelectedItem.Text, g1.Cells[7].Text, g1.Cells[8].Text);
                }
                if (dplay.SelectedValue == "DPN" || dplay.SelectedValue == "TPN" || dplay.SelectedValue == "FS")
                {
                    Alib.idExecute("Insert into winners(gamedataId,Username,Game,Play,Type,Number1,Number2,Points,Rewards,WinPoints,Date,Inserted,userEntry,playid) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + dgame.SelectedItem.Text + "','" + dplay.SelectedItem.Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + g1.Cells[6].Text + "','" + g1.Cells[7].Text + "','" + g1.Cells[8].Text + "','" + g1.Cells[9].Text + "','" + g1.Cells[10].Text + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "','" + g1.Cells[11].Text + "','" + g1.Cells[3].Text + "')");
                    Alib.idExecute("update users set points=convert(int,points)+'" + g1.Cells[9].Text + "', lastwinpoints='" + g1.Cells[9].Text + "' where phone='" + g1.Cells[1].Text + "'");
                    sendList(g1.Cells[1].Text, dgame.SelectedItem.Text, dplay.SelectedItem.Text, g1.Cells[9].Text, g1.Cells[10].Text);
                }
                if (dplay.SelectedValue == "HS")
                {
                    Alib.idExecute("Insert into winners(gamedataId,Username,Game,Play,Type,Number1,Number2,Digit,Points,Rewards,WinPoints,Date,Inserted,userEntry,playid) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + dgame.SelectedItem.Text + "','" + dplay.SelectedItem.Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + g1.Cells[6].Text + "','" + g1.Cells[7].Text + "','" + g1.Cells[8].Text + "','" + g1.Cells[9].Text + "','" + g1.Cells[10].Text + "','" + g1.Cells[11].Text + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "','" + g1.Cells[12].Text + "','" + g1.Cells[3].Text + "')");
                    Alib.idExecute("update users set points=convert(int,points)+'" + g1.Cells[10].Text + "', lastwinpoints='" + g1.Cells[10].Text + "' where phone='" + g1.Cells[1].Text + "'");
                    sendList(g1.Cells[1].Text, dgame.SelectedItem.Text, dplay.SelectedItem.Text, g1.Cells[10].Text, g1.Cells[11].Text);

                }
                if (dplay.SelectedValue == "SP" || dplay.SelectedValue == "DP" || dplay.SelectedValue == "SPDPTP")
                {
                    Alib.idExecute("Insert into winners(gamedataId,Username,Game,Play,Type,Number1,Points,Rewards,WinPoints,Date,Inserted,userEntry,playid) " +
                        "values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + dgame.SelectedItem.Text + "','" + dplay.SelectedItem.Text + "'," +
                        "'" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + g1.Cells[7].Text + "','" + g1.Cells[8].Text + "','" + g1.Cells[9].Text + "'," +
                        "'" + g1.Cells[10].Text + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "','" + g1.Cells[11].Text + "'," +
                        "'" + g1.Cells[3].Text + "' )");
                    Alib.idExecute("update users set points=convert(int,points)+'" + g1.Cells[8].Text + "', lastwinpoints='" + g1.Cells[8].Text + "' where phone='" + g1.Cells[1].Text + "'");
                    sendList(g1.Cells[1].Text, dgame.SelectedItem.Text, dplay.SelectedItem.Text, g1.Cells[8].Text, g1.Cells[9].Text);
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Points Added To Wallet',text: '',timer: 2000,showConfirmButton: false})", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Points Already Added',text: '',timer: 2000,showConfirmButton: false})", true);
            }
        }
    }

    protected void gvwinner_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (Alib.idHasRows("SELECT gamedataId FROM winners WHERE gamedataId='" + e.Row.Cells[0].Text + "' "))
            {
                btnwlt.Visible = false;
                divmsg.Visible = true;
                foreach (TableCell cell in e.Row.Cells)
                {
                    cell.BackColor = Color.LightGreen;
                    cell.ForeColor = Color.Black;
                }
            }
            else
            {
                btnwlt.Visible = true;
                divmsg.Visible = false;
            }
        }
    }
    public bool ValidateServerCertificate(
                                     object sender,
                                     X509Certificate certificate,
                                     X509Chain chain,
                                     SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }

    public void sendList(string username, string game, string play, string winpoints, string date)
    {
        try
        {
            List<string> list1 = new List<string>();
            using (SqlConnection con = new SqlConnection(Alib.conStr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select DISTINCT nkey from notify where nkey <> '' and userid='" + username + "'", con))
                {
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {
                        while (rdr.Read())
                        {
                            list1.Add(rdr["nkey"].ToString());
                        }
                    }
                }
                con.Close();
            }
            sendNotificationFCM(list1, username, game, play, winpoints, date);
        }
        catch (Exception ex)
        {

        }
    }
    public void sendNotificationFCM(List<string> gcmid, string username, string game, string play, string winpoints, string date)
    {
        WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
        tRequest.Method = "post";
        //serverKey - Key from Firebase cloud messaging server  
        tRequest.Headers.Add(string.Format("Authorization: key={0}", "AIzaSyC00qKaQ9-0m63GqFXW8RdhI3Fxs9NJAZs"));
        //Sender Id - From firebase project setting  
        tRequest.Headers.Add(string.Format("Sender: id={0}", "229579399259"));
        tRequest.ContentType = "application/json";
        string bodymsg = username + " - " + date;
        string titlemsg = "Won " + winpoints + " - " + game + " - " + play;

        var payload = new
        {
            registration_ids = gcmid,
            priority = "high",
            content_available = true,
            notification = new
            {
                body = bodymsg,
                title = titlemsg,
                badge = 1
            },
        };

        string postbody = JsonConvert.SerializeObject(payload).ToString();
        Byte[] byteArray = Encoding.UTF8.GetBytes(postbody);
        tRequest.ContentLength = byteArray.Length;
        using (Stream dataStream = tRequest.GetRequestStream())
        {
            dataStream.Write(byteArray, 0, byteArray.Length);
            using (WebResponse tResponse = tRequest.GetResponse())
            {
                using (Stream dataStreamResponse = tResponse.GetResponseStream())
                {
                    if (dataStreamResponse != null) using (StreamReader tReader = new StreamReader(dataStreamResponse))
                        {
                            String sResponseFromServer = tReader.ReadToEnd();
                            //result.Response = sResponseFromServer;
                        }
                }
            }
        }
        Alib.idExecute("Insert into notifications (userid,title,msg,insertedDate) values('" + username + "','" + bodymsg + "','" + titlemsg + "','" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString() + "') ");
    }
}