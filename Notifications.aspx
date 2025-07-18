<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-md-6">
       <%-- <label class="lblfont">Search by</label>: &nbsp;
            <asp:TextBox ID="txtid" runat="server" placeholder="Phone"></asp:TextBox>
        <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />--%>
        <div class="table-responsive">
            <asp:GridView ID="gvsprovider" runat="server" PageSize="25" CssClass="table table-bordered table-hover table-striped" Caption="Notifications" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="msg" HeaderText="msg" SortExpression="msg" />
                    <asp:BoundField DataField="insertedDate" HeaderText="insertedDate" SortExpression="insertedDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString12 %>" DeleteCommand="DELETE FROM [notifications] WHERE [id] = @id" InsertCommand="INSERT INTO [notifications] ([userid], [title], [msg], [insertedDate]) VALUES (@userid, @title, @msg, @insertedDate)" SelectCommand="SELECT * FROM [notifications] ORDER BY [id] DESC" UpdateCommand="UPDATE [notifications] SET [userid] = @userid, [title] = @title, [msg] = @msg, [insertedDate] = @insertedDate WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="msg" Type="String" />
                    <asp:Parameter Name="insertedDate" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="msg" Type="String" />
                    <asp:Parameter Name="insertedDate" Type="String" />
                    <asp:Parameter Name="id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="col-md-6">
     <%--   <label class="lblfont">Search by</label>: &nbsp;
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Phone"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />--%>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" PageSize="25" CssClass="table table-bordered table-hover table-striped" Caption="Starline Notifications" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="msg" HeaderText="msg" SortExpression="msg" />
                    <asp:BoundField DataField="insertedDate" HeaderText="insertedDate" SortExpression="insertedDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString13 %>" DeleteCommand="DELETE FROM [starline_notifications] WHERE [id] = @id" InsertCommand="INSERT INTO [starline_notifications] ([userid], [title], [msg], [insertedDate]) VALUES (@userid, @title, @msg, @insertedDate)" SelectCommand="SELECT * FROM [starline_notifications] ORDER BY [id] DESC" UpdateCommand="UPDATE [starline_notifications] SET [userid] = @userid, [title] = @title, [msg] = @msg, [insertedDate] = @insertedDate WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="msg" Type="String" />
                    <asp:Parameter Name="insertedDate" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="msg" Type="String" />
                    <asp:Parameter Name="insertedDate" Type="String" />
                    <asp:Parameter Name="id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

