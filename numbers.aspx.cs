using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class numbers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Glib.LoadRequest("select * from [numbers] order by id desc", gvsprovider);
            gameBind();
        }
        tdate.Text = System.DateTime.Now.AddHours(12).AddMinutes(30).ToString("dd/MM/yyyy");
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

    public void clear()
    {
        tdigit.Text = tdate.Text = topen.Text = tclose.Text = "";
        gameBind();
        btnAdd.Text = "Submit";
    }
    protected void gvsprovider_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvsprovider.PageIndex = e.NewPageIndex;
        Glib.LoadRequest("select * from [numbers] order by id desc", gvsprovider);
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
                lblid.Text = id;
                Alib.idExecute("delete from numbers where id=" + id);
                Glib.LoadRequest("select * from [numbers] order by id desc", gvsprovider);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Deleted',text: '',timer: 2000,showConfirmButton: false})", true);

            }
            if (e.CommandName.Equals("edi"))
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow rows = gvsprovider.Rows[index];
                    string id = HttpUtility.HtmlDecode(rows.Cells[2].Text).ToString();
                    lblid.Text = id;
                    btnAdd.Text = "Update";
                    SqlConnection conn = new SqlConnection(Alib.conStr);
                    SqlCommand cmd = null;
                    SqlDataReader reader = null;
                    cmd = new SqlCommand("select * from numbers where id='" + lblid.Text + "'", conn);
                    conn.Open();
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            topen.Text = reader["opennumber"].ToString();
                            tdigit.Text = reader["digit"].ToString();
                            tclose.Text = reader["closenumber"].ToString();
                            dgame.SelectedItem.Text = reader["game"].ToString();
                            tdate.Text = reader["date"].ToString();
                        }
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (topen.Text == "" || tdigit.Text == "" || dgame.SelectedValue == "Select" || tdate.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Enter Fileds',text: '',timer: 2000,showConfirmButton: false})", true);
                return;
            }
            else
            {
                if (btnAdd.Text != "Update")
                {
                    SqlConnection con = new SqlConnection(Alib.conStr);
                    SqlCommand cmd;
                    con.Open();
                    string sql = "insert into numbers (opennumber, digit, closenumber, gameid, game, date, time) values('" + topen.Text + "', '" + tdigit.Text + "', '" + tclose.Text + "', '" + dgame.SelectedValue + "', '" + dgame.SelectedItem.Text + "', '" + tdate.Text + "', '" + dopen1.SelectedItem.Text + " : " + dopen2.SelectedItem.Text + " " + dopen3.SelectedItem.Text + "')";
                    cmd = new SqlCommand(sql, con);
                    int res;
                    res = cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Submitted',text: '',timer: 2000,showConfirmButton: false})", true);
                    con.Close();

                }
                else
                {
                    Alib.idExecute("update numbers set opennumber='" + topen.Text + "',digit='" + tdigit.Text + "',closenumber='" + tclose.Text + "', date = '" + tdate.Text + "'  where id='" + lblid.Text + "'");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "swal({title: 'Successfully Updated',text: '',timer: 2000,showConfirmButton: false})", true);

                }
                Glib.LoadRequest("select * from [numbers] order by id desc", gvsprovider);
                sendList1(topen.Text, tdigit.Text, tclose.Text, dgame.SelectedItem.Text, tdate.Text);
                clear();
                return;
            }
        }
        catch (Exception ex)
        {
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

    public void sendList1(string open, string digit, string close, string game, string date)
    {
        try
        {
            List<string> list1 = new List<string>();
            using (SqlConnection con = new SqlConnection(Alib.conStr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select DISTINCT nkey from notify where nkey <> ''", con))
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
            sendNotificationFCM(list1, open, digit, close, game, date);
        }
        catch (Exception ex)
        {

        }
    }
    //public void sendList2()
    //{
    //    try
    //    {
    //        List<string> list2 = new List<string>();
    //        using (SqlConnection con = new SqlConnection(Alib.conStr))
    //        {
    //            con.Open();
    //            using (SqlCommand cmd = new SqlCommand("select DISTINCT nkey from Sarkara_Notify where nkey <> '' and id>11013", con))
    //            {
    //                SqlDataReader rdr = cmd.ExecuteReader();
    //                if (rdr.HasRows)
    //                {
    //                    while (rdr.Read())
    //                    {
    //                        list2.Add(rdr["nkey"].ToString());
    //                    }
    //                }
    //            }
    //            con.Close();
    //        }
    //        sendNotificationFCM(list2);
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}

    public void sendNotificationFCM(List<string> gcmid, string open, string digit, string close, string game, string date)
    {
        WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
        tRequest.Method = "post";
        //serverKey - Key from Firebase cloud messaging server  
        tRequest.Headers.Add(string.Format("Authorization: key={0}", "AIzaSyC00qKaQ9-0m63GqFXW8RdhI3Fxs9NJAZs"));
        //Sender Id - From firebase project setting  
        tRequest.Headers.Add(string.Format("Sender: id={0}", "229579399259"));
        tRequest.ContentType = "application/json";
        string bodymsg = "";
        string titlemsg = dgame.SelectedItem.Text + "-" + System.DateTime.Now.AddHours(12).AddMinutes(30).ToString("dd/MM/yyyy");
        if (close != "")
        {
            bodymsg = topen.Text + "-" + tdigit.Text + "-" + tclose.Text;
        }
        else
        {
            bodymsg = topen.Text + "-" + tdigit.Text;
        }

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
    }

    protected void btnCan_Click(object sender, EventArgs e)
    {
        clear();
    }
}