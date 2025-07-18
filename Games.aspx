<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Games.aspx.cs" Inherits="Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
    <h3><b>Game Details</b></h3>
    <br />
    <div class="row">
        <div class="col-md-8">
            <div>
                <label>Game Name</label>
                <asp:TextBox ID="tname" runat="server" CssClass="form-control" placeholder="Enter Game Name" />
                <br />
            </div>
            <div class="form-inline">
                <label>Days</label>
                <asp:DropDownList ID="ddays" runat="server">
                    <asp:ListItem>--</asp:ListItem>
                    <asp:ListItem>Everyday</asp:ListItem>
                    <asp:ListItem>Mon-Fri</asp:ListItem>
                    <asp:ListItem>Mon-Sat</asp:ListItem>
                    <asp:ListItem>Holiday</asp:ListItem>
                </asp:DropDownList>
                 &nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label>Opens @</label>
                HH-<asp:DropDownList ID="dopen1" runat="server">
                    <asp:ListItem>--</asp:ListItem>
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
                MM-<asp:DropDownList ID="dopen2" runat="server">
                    <asp:ListItem>--</asp:ListItem>
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
                <asp:DropDownList ID="dopen3" runat="server">
                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label>Close @</label>
                HH-<asp:DropDownList ID="dclose1" runat="server">
                    <asp:ListItem>--</asp:ListItem>
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
                MM-<asp:DropDownList ID="dclose2" runat="server">
                    <asp:ListItem>--</asp:ListItem>
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
                <asp:DropDownList ID="dclose3" runat="server">
                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Submit" OnClick="btnAdd_Click" Height="38" Width="20%" />
            <br />
            <br />
            <div class="table-responsive">
                <asp:GridView ID="gvsprovider" runat="server" CssClass="table table-bordered table-hover table-striped" AllowPaging="True" Caption="Games"
                    EmptyDataText="No Data Found &#128542;" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="gamesDS">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="opentime" HeaderText="opentime" SortExpression="opentime" />
                        <asp:BoundField DataField="closetime" HeaderText="closetime" SortExpression="closetime" />
                        <asp:BoundField DataField="gameid" HeaderText="gameid" SortExpression="gameid" />
                        <asp:BoundField DataField="days" HeaderText="days" SortExpression="days" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="gamesDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString2 %>" DeleteCommand="DELETE FROM [maingames] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([opentime] = @original_opentime) OR ([opentime] IS NULL AND @original_opentime IS NULL)) AND (([closetime] = @original_closetime) OR ([closetime] IS NULL AND @original_closetime IS NULL)) AND (([gameid] = @original_gameid) OR ([gameid] IS NULL AND @original_gameid IS NULL)) AND (([days] = @original_days) OR ([days] IS NULL AND @original_days IS NULL))" InsertCommand="INSERT INTO [maingames] ([name], [opentime], [closetime], [gameid], [days]) VALUES (@name, @opentime, @closetime, @gameid, @days)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [maingames] ORDER BY [id]" UpdateCommand="UPDATE [maingames] SET [name] = @name, [opentime] = @opentime, [closetime] = @closetime, [gameid] = @gameid, [days] = @days WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([opentime] = @original_opentime) OR ([opentime] IS NULL AND @original_opentime IS NULL)) AND (([closetime] = @original_closetime) OR ([closetime] IS NULL AND @original_closetime IS NULL)) AND (([gameid] = @original_gameid) OR ([gameid] IS NULL AND @original_gameid IS NULL)) AND (([days] = @original_days) OR ([days] IS NULL AND @original_days IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_opentime" Type="String" />
                        <asp:Parameter Name="original_closetime" Type="String" />
                        <asp:Parameter Name="original_gameid" Type="String" />
                        <asp:Parameter Name="original_days" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="opentime" Type="String" />
                        <asp:Parameter Name="closetime" Type="String" />
                        <asp:Parameter Name="gameid" Type="String" />
                        <asp:Parameter Name="days" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="opentime" Type="String" />
                        <asp:Parameter Name="closetime" Type="String" />
                        <asp:Parameter Name="gameid" Type="String" />
                        <asp:Parameter Name="days" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_opentime" Type="String" />
                        <asp:Parameter Name="original_closetime" Type="String" />
                        <asp:Parameter Name="original_gameid" Type="String" />
                        <asp:Parameter Name="original_days" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-4">
            <div>
                <label>Play Name</label>
                <asp:TextBox ID="tplay" runat="server" CssClass="form-control" placeholder="Enter Play Name" />
                <br />
            </div>
            <div>
                <label>Award Points (for 1 user point)</label>
                <asp:TextBox ID="tawrds" runat="server" CssClass="form-control" placeholder="Enter Awards Point" MaxLength="8" />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tawrds"
                ValidationExpression="^\d+$" ForeColor="#FF3300" Text="numbers only"></asp:RegularExpressionValidator>
                <br />
            </div>
            <asp:Button ID="btnAdd1" runat="server" class="btn btn-success" Text="Submit" OnClick="btnAdd1_Click" Height="38" Width="20%" />
            <br />
            <br />
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-striped" Caption="Plays"
                    EmptyDataText="No Data Found &#128542;" PageSize="20" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="playsDS">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="awardpoints" HeaderText="awardpoints" SortExpression="awardpoints" />
                        <asp:BoundField DataField="playid" HeaderText="playid" SortExpression="playid" />
                        <asp:BoundField DataField="playids" HeaderText="playids" SortExpression="playids" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="playsDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString3 %>" DeleteCommand="DELETE FROM [plays] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([awardpoints] = @original_awardpoints) OR ([awardpoints] IS NULL AND @original_awardpoints IS NULL)) AND (([playid] = @original_playid) OR ([playid] IS NULL AND @original_playid IS NULL)) AND (([playids] = @original_playids) OR ([playids] IS NULL AND @original_playids IS NULL))" InsertCommand="INSERT INTO [plays] ([name], [awardpoints], [playid], [playids]) VALUES (@name, @awardpoints, @playid, @playids)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [plays] ORDER BY [id]" UpdateCommand="UPDATE [plays] SET [name] = @name, [awardpoints] = @awardpoints, [playid] = @playid, [playids] = @playids WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([awardpoints] = @original_awardpoints) OR ([awardpoints] IS NULL AND @original_awardpoints IS NULL)) AND (([playid] = @original_playid) OR ([playid] IS NULL AND @original_playid IS NULL)) AND (([playids] = @original_playids) OR ([playids] IS NULL AND @original_playids IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_awardpoints" Type="String" />
                        <asp:Parameter Name="original_playid" Type="String" />
                        <asp:Parameter Name="original_playids" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="awardpoints" Type="String" />
                        <asp:Parameter Name="playid" Type="String" />
                        <asp:Parameter Name="playids" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="awardpoints" Type="String" />
                        <asp:Parameter Name="playid" Type="String" />
                        <asp:Parameter Name="playids" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_awardpoints" Type="String" />
                        <asp:Parameter Name="original_playid" Type="String" />
                        <asp:Parameter Name="original_playids" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

