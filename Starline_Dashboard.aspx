<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Starline_Dashboard.aspx.cs" Inherits="Starline_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= tdate.ClientID%>").datepicker({ dateFormat: "dd/mm/yy" });
        });
    </script>
    <style>
        .lblfont {
            font-size: medium;
        }

        .lblfont1 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-2">
            <label>Date</label>
            <asp:TextBox ID="tdate" runat="server" CssClass="form-control" placeholder="Enter Date" OnTextChanged="tdate_TextChanged" AutoPostBack="true" Font-Bold="true" />
            <br />
            <label>Starline Game</label>
            <asp:DropDownList ID="dgame" runat="server" CssClass="form-control" Font-Bold="true" OnSelectedIndexChanged="dgame_SelectedIndexChanged" AutoPostBack="true" />
            <br />
            <label>Starline Play</label>
            <asp:DropDownList ID="dplay" runat="server" CssClass="form-control" Font-Bold="true" OnSelectedIndexChanged="dplay_SelectedIndexChanged" AutoPostBack="true" />
            <br />
            <asp:Button ID="btnCal" runat="server" class="btn btn-success" Width="100" Height="30" Text="Calculate" OnClick="btnCal_Click" />
        </div>
        <div class="col-md-10">
            <br />
            <label class="lblfont">Won number</label>: &nbsp;
            <label id="lblopen" class="lblfont1" runat="server" style="color: red">0</label>-<label class="lblfont1" id="lbldigit" runat="server" style="color: red">0</label>
            &nbsp; | &nbsp; 
            <label class="lblfont">Users</label>: &nbsp;
            <label class="lblfont" id="tusers" runat="server" style="color: red">0</label>&nbsp; | &nbsp; 
            <label class="lblfont">Records</label>: &nbsp;
            <label class="lblfont" id="tgames" runat="server" style="color: red">0</label>&nbsp; | &nbsp; 
            <label class="lblfont">Points</label>: &nbsp;
            <label class="lblfont" id="tpoints" runat="server" style="color: red">0</label>
            &nbsp; | &nbsp;
            <label class="lblfont">Search by</label>: &nbsp;
            <asp:TextBox ID="txtid" runat="server" placeholder="ID/ Username"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="No data found" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-BackColor="#ff957b" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Font-Size="small" EmptyDataRowStyle-BorderStyle="Ridge" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" GridLines="None">
            </asp:GridView>
        </div>
    </div>
    <br />
    <div class="row">
        <div id="divmsg" runat="server" style="background-color: lightgreen; display: none;" class="col-md-4">
            Points Are Added To Wallet
        </div>
        <asp:GridView ID="gvwinner" runat="server" EmptyDataText="Winner Not Found &#128557" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-BackColor="#ff957b" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Font-Size="Large" EmptyDataRowStyle-BorderStyle="Ridge" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvwinner_RowDataBound">
        </asp:GridView>
        <asp:Button ID="btnwlt" runat="server" Visible="false" class="btn btn-success" Width="100" Height="30" Text="Add To Wallet" OnClick="btnwlt_Click" />
    </div>
</asp:Content>

