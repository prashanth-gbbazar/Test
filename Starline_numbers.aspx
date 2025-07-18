<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Starline_numbers.aspx.cs" Inherits="Starline_numbers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= tdate.ClientID%>").datepicker({ dateFormat: "dd/mm/yy" });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
    <h3><b>Starline Numbers</b></h3>
    <br />
    <div class="row">
        <div class="col-md-1">
            <label>Open</label>
            <asp:TextBox ID="topen" runat="server" class="form-control" placeholder="XXX" MaxLength="3" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="topen"
                ValidationExpression="[0-9]{3}" ForeColor="#FF3300" Text="3-digits"></asp:RegularExpressionValidator>
        </div>
        <div class="col-md-1">
            <label>Digit</label>
            <asp:TextBox ID="tdigit" runat="server" class="form-control" placeholder="XX" MaxLength="2" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tdigit"
                ValidationExpression="^\d+$" ForeColor="#FF3300" Text="digits"></asp:RegularExpressionValidator>
        </div>
        <div class="col-md-2">
            <label>Game</label>
            <asp:DropDownList ID="dgame" runat="server" class="form-control" />
        </div>
        <div class="col-md-2">
            <label>Date</label>
            <asp:TextBox ID="tdate" runat="server" class="form-control" placeholder="Date" />
        </div>
        <div class="col-md-1">
            <label>Time(HH)</label>
            <asp:DropDownList ID="dopen1" runat="server" class="form-control">
                <asp:ListItem>HH</asp:ListItem>
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-1">
            <label>Time(MM)</label>
            <asp:DropDownList ID="dopen2" runat="server" class="form-control">
                <asp:ListItem>MM</asp:ListItem>
                <asp:ListItem>00</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>35</asp:ListItem>
                <asp:ListItem>40</asp:ListItem>
                <asp:ListItem>45</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>55</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-1">
            <label>Time</label>
            <asp:DropDownList ID="dopen3" runat="server" class="form-control">
                <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-1">
            <label>Click to</label>
            <asp:Button ID="btnAdd" runat="server" class="form-control btn btn-success" Text="Submit" OnClick="btnAdd_Click" Height="33" />
        </div>
         <div class="col-md-1">
            <label>Click to</label>
            <asp:Button ID="btnCan" runat="server" class="form-control btn btn-danger" Text="Cancel" OnClick="btnCan_Click" Height="33" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="table-responsive">
            <asp:GridView ID="gvsprovider" runat="server" CssClass="table table-bordered table-hover table-striped" OnPageIndexChanging="gvsprovider_PageIndexChanging" OnRowCommand="gvsprovider_RowCommand" AllowPaging="True" PageSize="10" Caption="Numbers" AutoGenerateColumns="false"
                EmptyDataText="No Data Found" EmptyDataRowStyle-BackColor="#B0B5C0" EmptyDataRowStyle-Font-Bold="true" Style="box-shadow: 1px 1px 1px #888888;">
                <Columns>
                    <asp:ButtonField CommandName="edi" ControlStyle-CssClass="btn btn-info" HeaderStyle-Width="10px" ButtonType="Button"
                        Text="Edit" ControlStyle-ForeColor="Blue"></asp:ButtonField>
                    <asp:ButtonField CommandName="Del" ControlStyle-CssClass="btn btn-info" HeaderStyle-Width="10px" ButtonType="Button"
                        Text="delete" ControlStyle-ForeColor="Black"></asp:ButtonField>
                    <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                    <asp:BoundField DataField="opennumber" HeaderText="Open"></asp:BoundField>
                    <asp:BoundField DataField="digit" HeaderText="Digit"></asp:BoundField>
                    <asp:BoundField DataField="game" HeaderText="Game"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Date"></asp:BoundField>
                    <asp:BoundField DataField="time" HeaderText="Time"></asp:BoundField>
                </Columns>
                <PagerStyle CssClass="gridview"></PagerStyle>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

