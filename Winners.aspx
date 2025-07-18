<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Winners.aspx.cs" Inherits="Winners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-6">
       <%-- <label class="lblfont">Search by</label>: &nbsp;
            <asp:TextBox ID="txtid" runat="server" placeholder="Phone"></asp:TextBox>
        <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />--%>
        <div class="table-responsive">
            <asp:GridView ID="gvsprovider" runat="server" PageSize="25" CssClass="table table-bordered table-hover table-striped" Caption="Winners" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="gamedataId" HeaderText="gamedataId" SortExpression="gamedataId" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Game" HeaderText="Game" SortExpression="Game" />
                    <asp:BoundField DataField="Play" HeaderText="Play" SortExpression="Play" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Number1" HeaderText="Number1" SortExpression="Number1" />
                    <asp:BoundField DataField="Number2" HeaderText="Number2" SortExpression="Number2" />
                    <asp:BoundField DataField="Digit" HeaderText="Digit" SortExpression="Digit" />
                    <asp:BoundField DataField="Points" HeaderText="Points" SortExpression="Points" />
                    <asp:BoundField DataField="Rewards" HeaderText="Rewards" SortExpression="Rewards" />
                    <asp:BoundField DataField="WinPoints" HeaderText="WinPoints" SortExpression="WinPoints" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Inserted" HeaderText="Inserted" SortExpression="Inserted" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString10 %>" DeleteCommand="DELETE FROM [winners] WHERE [id] = @id" InsertCommand="INSERT INTO [winners] ([gamedataId], [Username], [Game], [Play], [Type], [Number1], [Number2], [Digit], [Points], [Rewards], [WinPoints], [Date], [Inserted]) VALUES (@gamedataId, @Username, @Game, @Play, @Type, @Number1, @Number2, @Digit, @Points, @Rewards, @WinPoints, @Date, @Inserted)" SelectCommand="SELECT * FROM [winners] ORDER BY [id] DESC" UpdateCommand="UPDATE [winners] SET [gamedataId] = @gamedataId, [Username] = @Username, [Game] = @Game, [Play] = @Play, [Type] = @Type, [Number1] = @Number1, [Number2] = @Number2, [Digit] = @Digit, [Points] = @Points, [Rewards] = @Rewards, [WinPoints] = @WinPoints, [Date] = @Date, [Inserted] = @Inserted WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="gamedataId" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Game" Type="String" />
                    <asp:Parameter Name="Play" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Number1" Type="String" />
                    <asp:Parameter Name="Number2" Type="String" />
                    <asp:Parameter Name="Digit" Type="String" />
                    <asp:Parameter Name="Points" Type="String" />
                    <asp:Parameter Name="Rewards" Type="String" />
                    <asp:Parameter Name="WinPoints" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="Inserted" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="gamedataId" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Game" Type="String" />
                    <asp:Parameter Name="Play" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Number1" Type="String" />
                    <asp:Parameter Name="Number2" Type="String" />
                    <asp:Parameter Name="Digit" Type="String" />
                    <asp:Parameter Name="Points" Type="String" />
                    <asp:Parameter Name="Rewards" Type="String" />
                    <asp:Parameter Name="WinPoints" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="Inserted" Type="String" />
                    <asp:Parameter Name="id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="col-md-6">
       <%-- <label class="lblfont">Search by</label>: &nbsp;
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Phone"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />--%>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" PageSize="25" CssClass="table table-bordered table-hover table-striped" Caption="Starline Winners" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="gamedataId" HeaderText="gamedataId" SortExpression="gamedataId" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Game" HeaderText="Game" SortExpression="Game" />
                    <asp:BoundField DataField="Play" HeaderText="Play" SortExpression="Play" />
                    <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                    <asp:BoundField DataField="Digit" HeaderText="Digit" SortExpression="Digit" />
                    <asp:BoundField DataField="Points" HeaderText="Points" SortExpression="Points" />
                    <asp:BoundField DataField="Rewards" HeaderText="Rewards" SortExpression="Rewards" />
                    <asp:BoundField DataField="WinPoints" HeaderText="WinPoints" SortExpression="WinPoints" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Inserted" HeaderText="Inserted" SortExpression="Inserted" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString11 %>" DeleteCommand="DELETE FROM [starline_winners] WHERE [id] = @id" InsertCommand="INSERT INTO [starline_winners] ([gamedataId], [Username], [Game], [Play], [Number], [Digit], [Points], [Rewards], [WinPoints], [Date], [Inserted]) VALUES (@gamedataId, @Username, @Game, @Play, @Number, @Digit, @Points, @Rewards, @WinPoints, @Date, @Inserted)" SelectCommand="SELECT * FROM [starline_winners] ORDER BY [id] DESC" UpdateCommand="UPDATE [starline_winners] SET [gamedataId] = @gamedataId, [Username] = @Username, [Game] = @Game, [Play] = @Play, [Number] = @Number, [Digit] = @Digit, [Points] = @Points, [Rewards] = @Rewards, [WinPoints] = @WinPoints, [Date] = @Date, [Inserted] = @Inserted WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="gamedataId" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Game" Type="String" />
                    <asp:Parameter Name="Play" Type="String" />
                    <asp:Parameter Name="Number" Type="String" />
                    <asp:Parameter Name="Digit" Type="String" />
                    <asp:Parameter Name="Points" Type="String" />
                    <asp:Parameter Name="Rewards" Type="String" />
                    <asp:Parameter Name="WinPoints" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="Inserted" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="gamedataId" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Game" Type="String" />
                    <asp:Parameter Name="Play" Type="String" />
                    <asp:Parameter Name="Number" Type="String" />
                    <asp:Parameter Name="Digit" Type="String" />
                    <asp:Parameter Name="Points" Type="String" />
                    <asp:Parameter Name="Rewards" Type="String" />
                    <asp:Parameter Name="WinPoints" Type="String" />
                    <asp:Parameter Name="Date" Type="String" />
                    <asp:Parameter Name="Inserted" Type="String" />
                    <asp:Parameter Name="id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

