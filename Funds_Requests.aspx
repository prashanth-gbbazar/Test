<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Funds_Requests.aspx.cs" Inherits="Funds_Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-1" style="background-color:green;color:azure">Waiting</div>
        <div class="col-md-1" style="background-color:red;color:azure">Completed</div>
        <div class="col-md-1" style="background-color:dimgray;color:azure">Deleted</div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="table-responsive">
                <asp:GridView ID="gvsprovider" runat="server" CssClass="table table-bordered table-hover table-striped" OnRowDataBound="gvsprovider_RowDataBound" OnPageIndexChanging="gvsprovider_PageIndexChanging" OnRowCommand="gvsprovider_RowCommand" AllowPaging="True" PageSize="50" Caption="Withdraw Funds Request" AutoGenerateColumns="false"
                    EmptyDataText="No Data Found" EmptyDataRowStyle-BackColor="#B0B5C0" EmptyDataRowStyle-Font-Bold="true" Style="box-shadow: 1px 1px 1px #888888;">
                    <Columns>
                        <asp:ButtonField CommandName="edi" ControlStyle-CssClass="btn btn-info" HeaderStyle-Width="10px" ButtonType="Button"
                            Text="draw" ControlStyle-ForeColor="Blue"></asp:ButtonField>
                        <asp:ButtonField CommandName="Del" ControlStyle-CssClass="btn btn-info" HeaderStyle-Width="10px" ButtonType="Button"
                            Text="delete" ControlStyle-ForeColor="Black"></asp:ButtonField>
                        <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                        <asp:BoundField DataField="userid" HeaderText="User"></asp:BoundField>
                        <asp:BoundField DataField="requestpoints" HeaderText="Requested Points"></asp:BoundField>
                        <asp:BoundField DataField="date" HeaderText="Date"></asp:BoundField>
                        <asp:BoundField DataField="state" HeaderText="State"></asp:BoundField>
                    </Columns>
                    <PagerStyle CssClass="gridview"></PagerStyle>
                </asp:GridView>
            </div>
        </div>
        <div class="col-md-6">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-striped" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" AllowPaging="True" PageSize="50" OnRowDataBound="GridView1_RowDataBound" Caption="Add Funds Request" AutoGenerateColumns="false"
                    EmptyDataText="No Data Found" EmptyDataRowStyle-BackColor="#B0B5C0" EmptyDataRowStyle-Font-Bold="true" Style="box-shadow: 1px 1px 1px #888888;">
                    <Columns>
                        <asp:ButtonField CommandName="edi" ControlStyle-CssClass="btn btn-info" HeaderStyle-Width="10px" ButtonType="Button"
                            Text="add" ControlStyle-ForeColor="Blue"></asp:ButtonField>
                        <asp:ButtonField CommandName="Del" ControlStyle-CssClass="btn btn-info" HeaderStyle-Width="10px" ButtonType="Button"
                            Text="delete" ControlStyle-ForeColor="Black"></asp:ButtonField>
                        <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                        <asp:BoundField DataField="userid" HeaderText="User"></asp:BoundField>
                        <asp:BoundField DataField="addpoints" HeaderText="Add Points"></asp:BoundField>
                        <asp:BoundField DataField="date" HeaderText="Date"></asp:BoundField>
                        <asp:BoundField DataField="state" HeaderText="State"></asp:BoundField>
                    </Columns>
                    <PagerStyle CssClass="gridview"></PagerStyle>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

