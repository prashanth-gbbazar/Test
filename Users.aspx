<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="UNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
    <h3><b>Users</b></h3>
    <asp:TextBox ID="txtid" runat="server" placeholder="Phone Number"></asp:TextBox>
    <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
    
            <label>note: admin can edit only user points</label>
    <br />
    <%--    <div class="row">
        <div class="col-md-2">
            <label>Name</label>
            <asp:TextBox ID="tname" runat="server" CssClass="form-control" placeholder="Enter Name" />
            <br />
        </div>
        <div class="col-md-2">
            <label>Email</label>
            <asp:TextBox ID="temail" runat="server" CssClass="form-control" placeholder="Enter Email" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="temail"
                ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="#FF3300" Text="invalid email" Display="Dynamic"></asp:RegularExpressionValidator>

        </div>
        <div class="col-md-2">
            <label>Phone</label>
            <asp:TextBox ID="tphone" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter Phone" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tphone"
                ValidationExpression="[0-9]{10}" ForeColor="#FF3300" Text="10 digits number"></asp:RegularExpressionValidator>

        </div>
        <div class="col-md-2">
            <label>Points</label>
            <asp:TextBox ID="tpoints" runat="server" CssClass="form-control" MaxLength="8" placeholder="Enter Total Points" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tpoints"
                ValidationExpression="^\d+$" ForeColor="#FF3300" Text="numbers only"></asp:RegularExpressionValidator>

        </div>
        <div class="col-md-2">
            <label>Username</label>
            <asp:TextBox ID="tusername" runat="server" placeholder="Enter Username" CssClass="form-control" />

        </div>
        <div class="col-md-2">
            <label>Password</label>
            <asp:TextBox ID="tpassword" runat="server" placeholder="Enter Password" CssClass="form-control" />

        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Submit" OnClick="btnAdd_Click" Height="38" Width="100%" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnCancel" runat="server" class="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" Height="38" Width="100%" />
        </div>
    </div>--%>
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="gvsearch" Visible="false" runat="server" CssClass="table table-bordered table-hover table-striped">
                </asp:GridView>
                <asp:GridView ID="gvsprovider" Visible="true" runat="server" CssClass="table table-bordered table-hover table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="UserDs">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                        <asp:BoundField DataField="otp" HeaderText="otp" SortExpression="otp" />
                        <asp:BoundField DataField="points" HeaderText="points" SortExpression="points" />
                        <asp:BoundField DataField="lastpoints" HeaderText="lastpoints" SortExpression="lastpoints" />
                        <asp:BoundField DataField="remainingpoints" HeaderText="remainingpoints" SortExpression="remainingpoints" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="accname" HeaderText="accname" SortExpression="accname" />
                        <asp:BoundField DataField="bankname" HeaderText="bankname" SortExpression="bankname" />
                        <asp:BoundField DataField="accnum" HeaderText="accnum" SortExpression="accnum" />
                        <asp:BoundField DataField="ifsc" HeaderText="ifsc" SortExpression="ifsc" />
                        <asp:BoundField DataField="paytm" HeaderText="paytm" SortExpression="paytm" />
                        <asp:BoundField DataField="gpay" HeaderText="gpay" SortExpression="gpay" />
                        <asp:BoundField DataField="phonepe" HeaderText="phonepe" SortExpression="phonepe" />
                        <asp:BoundField DataField="mpn" HeaderText="mpn" SortExpression="mpn" />
                        <asp:BoundField DataField="isstarline" HeaderText="isstarline" SortExpression="isstarline" />
                        <asp:BoundField DataField="lastwithdrawn" HeaderText="lastwithdrawn" SortExpression="lastwithdrawn" />
                        <asp:BoundField DataField="lastwithdrawndate" HeaderText="lastwithdrawndate" SortExpression="lastwithdrawndate" />
                        <asp:BoundField DataField="withdrawstatus" HeaderText="withdrawstatus" SortExpression="withdrawstatus" />
                        <asp:BoundField DataField="addpointsstatus" HeaderText="addpointsstatus" SortExpression="addpointsstatus" />
                        <asp:BoundField DataField="lastwinpoints" HeaderText="lastwinpoints" SortExpression="lastwinpoints" />
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="UserDs" runat="server" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString9 %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @id" InsertCommand="INSERT INTO [users] ([name], [email], [phone], [username], [password], [otp], [points], [lastpoints], [remainingpoints], [address], [accname], [bankname], [accnum], [ifsc], [paytm], [gpay], [phonepe], [mpn], [isstarline], [lastwithdrawn], [lastwithdrawndate], [withdrawstatus], [addpointsstatus], [lastwinpoints]) VALUES (@name, @email, @phone, @username, @password, @otp, @points, @lastpoints, @remainingpoints, @address, @accname, @bankname, @accnum, @ifsc, @paytm, @gpay, @phonepe, @mpn, @isstarline, @lastwithdrawn, @lastwithdrawndate, @withdrawstatus, @addpointsstatus, @lastwinpoints)" SelectCommand="SELECT * FROM [users] ORDER BY [id] DESC" UpdateCommand="UPDATE [users] SET [name] = @name, [email] = @email, [phone] = @phone, [username] = @username, [password] = @password, [otp] = @otp, [points] = @points, [lastpoints] = @lastpoints, [remainingpoints] = @remainingpoints, [address] = @address, [accname] = @accname, [bankname] = @bankname, [accnum] = @accnum, [ifsc] = @ifsc, [paytm] = @paytm, [gpay] = @gpay, [phonepe] = @phonepe, [mpn] = @mpn, [isstarline] = @isstarline, [lastwithdrawn] = @lastwithdrawn, [lastwithdrawndate] = @lastwithdrawndate, [withdrawstatus] = @withdrawstatus, [addpointsstatus] = @addpointsstatus, [lastwinpoints] = @lastwinpoints WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="otp" Type="String" />
                        <asp:Parameter Name="points" Type="String" />
                        <asp:Parameter Name="lastpoints" Type="String" />
                        <asp:Parameter Name="remainingpoints" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="accname" Type="String" />
                        <asp:Parameter Name="bankname" Type="String" />
                        <asp:Parameter Name="accnum" Type="String" />
                        <asp:Parameter Name="ifsc" Type="String" />
                        <asp:Parameter Name="paytm" Type="String" />
                        <asp:Parameter Name="gpay" Type="String" />
                        <asp:Parameter Name="phonepe" Type="String" />
                        <asp:Parameter Name="mpn" Type="String" />
                        <asp:Parameter Name="isstarline" Type="String" />
                        <asp:Parameter Name="lastwithdrawn" Type="String" />
                        <asp:Parameter Name="lastwithdrawndate" Type="String" />
                        <asp:Parameter Name="withdrawstatus" Type="String" />
                        <asp:Parameter Name="addpointsstatus" Type="String" />
                        <asp:Parameter Name="lastwinpoints" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="otp" Type="String" />
                        <asp:Parameter Name="points" Type="String" />
                        <asp:Parameter Name="lastpoints" Type="String" />
                        <asp:Parameter Name="remainingpoints" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="accname" Type="String" />
                        <asp:Parameter Name="bankname" Type="String" />
                        <asp:Parameter Name="accnum" Type="String" />
                        <asp:Parameter Name="ifsc" Type="String" />
                        <asp:Parameter Name="paytm" Type="String" />
                        <asp:Parameter Name="gpay" Type="String" />
                        <asp:Parameter Name="phonepe" Type="String" />
                        <asp:Parameter Name="mpn" Type="String" />
                        <asp:Parameter Name="isstarline" Type="String" />
                        <asp:Parameter Name="lastwithdrawn" Type="String" />
                        <asp:Parameter Name="lastwithdrawndate" Type="String" />
                        <asp:Parameter Name="withdrawstatus" Type="String" />
                        <asp:Parameter Name="addpointsstatus" Type="String" />
                        <asp:Parameter Name="lastwinpoints" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="usersDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:goldenbazarConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([otp] = @original_otp) OR ([otp] IS NULL AND @original_otp IS NULL)) AND (([points] = @original_points) OR ([points] IS NULL AND @original_points IS NULL)) AND (([lastpoints] = @original_lastpoints) OR ([lastpoints] IS NULL AND @original_lastpoints IS NULL)) AND (([remainingpoints] = @original_remainingpoints) OR ([remainingpoints] IS NULL AND @original_remainingpoints IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([accname] = @original_accname) OR ([accname] IS NULL AND @original_accname IS NULL)) AND (([bankname] = @original_bankname) OR ([bankname] IS NULL AND @original_bankname IS NULL)) AND (([accnum] = @original_accnum) OR ([accnum] IS NULL AND @original_accnum IS NULL)) AND (([ifsc] = @original_ifsc) OR ([ifsc] IS NULL AND @original_ifsc IS NULL)) AND (([paytm] = @original_paytm) OR ([paytm] IS NULL AND @original_paytm IS NULL)) AND (([gpay] = @original_gpay) OR ([gpay] IS NULL AND @original_gpay IS NULL)) AND (([phonepe] = @original_phonepe) OR ([phonepe] IS NULL AND @original_phonepe IS NULL)) AND (([mpn] = @original_mpn) OR ([mpn] IS NULL AND @original_mpn IS NULL)) AND (([isstarline] = @original_isstarline) OR ([isstarline] IS NULL AND @original_isstarline IS NULL)) AND (([lastwithdrawn] = @original_lastwithdrawn) OR ([lastwithdrawn] IS NULL AND @original_lastwithdrawn IS NULL)) AND (([lastwithdrawndate] = @original_lastwithdrawndate) OR ([lastwithdrawndate] IS NULL AND @original_lastwithdrawndate IS NULL))" InsertCommand="INSERT INTO [users] ([name], [email], [phone], [username], [password], [otp], [points], [lastpoints], [remainingpoints], [address], [accname], [bankname], [accnum], [ifsc], [paytm], [gpay], [phonepe], [mpn], [isstarline], [lastwithdrawn], [lastwithdrawndate]) VALUES (@name, @email, @phone, @username, @password, @otp, @points, @lastpoints, @remainingpoints, @address, @accname, @bankname, @accnum, @ifsc, @paytm, @gpay, @phonepe, @mpn, @isstarline, @lastwithdrawn, @lastwithdrawndate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [users] ORDER BY [id] DESC" UpdateCommand="UPDATE [users] SET [name] = @name, [email] = @email, [phone] = @phone, [username] = @username, [password] = @password, [otp] = @otp, [points] = @points, [lastpoints] = @lastpoints, [remainingpoints] = @remainingpoints, [address] = @address, [accname] = @accname, [bankname] = @bankname, [accnum] = @accnum, [ifsc] = @ifsc, [paytm] = @paytm, [gpay] = @gpay, [phonepe] = @phonepe, [mpn] = @mpn, [isstarline] = @isstarline, [lastwithdrawn] = @lastwithdrawn, [lastwithdrawndate] = @lastwithdrawndate WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([otp] = @original_otp) OR ([otp] IS NULL AND @original_otp IS NULL)) AND (([points] = @original_points) OR ([points] IS NULL AND @original_points IS NULL)) AND (([lastpoints] = @original_lastpoints) OR ([lastpoints] IS NULL AND @original_lastpoints IS NULL)) AND (([remainingpoints] = @original_remainingpoints) OR ([remainingpoints] IS NULL AND @original_remainingpoints IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([accname] = @original_accname) OR ([accname] IS NULL AND @original_accname IS NULL)) AND (([bankname] = @original_bankname) OR ([bankname] IS NULL AND @original_bankname IS NULL)) AND (([accnum] = @original_accnum) OR ([accnum] IS NULL AND @original_accnum IS NULL)) AND (([ifsc] = @original_ifsc) OR ([ifsc] IS NULL AND @original_ifsc IS NULL)) AND (([paytm] = @original_paytm) OR ([paytm] IS NULL AND @original_paytm IS NULL)) AND (([gpay] = @original_gpay) OR ([gpay] IS NULL AND @original_gpay IS NULL)) AND (([phonepe] = @original_phonepe) OR ([phonepe] IS NULL AND @original_phonepe IS NULL)) AND (([mpn] = @original_mpn) OR ([mpn] IS NULL AND @original_mpn IS NULL)) AND (([isstarline] = @original_isstarline) OR ([isstarline] IS NULL AND @original_isstarline IS NULL)) AND (([lastwithdrawn] = @original_lastwithdrawn) OR ([lastwithdrawn] IS NULL AND @original_lastwithdrawn IS NULL)) AND (([lastwithdrawndate] = @original_lastwithdrawndate) OR ([lastwithdrawndate] IS NULL AND @original_lastwithdrawndate IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_phone" Type="String" />
                        <asp:Parameter Name="original_username" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_otp" Type="String" />
                        <asp:Parameter Name="original_points" Type="String" />
                        <asp:Parameter Name="original_lastpoints" Type="String" />
                        <asp:Parameter Name="original_remainingpoints" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_accname" Type="String" />
                        <asp:Parameter Name="original_bankname" Type="String" />
                        <asp:Parameter Name="original_accnum" Type="String" />
                        <asp:Parameter Name="original_ifsc" Type="String" />
                        <asp:Parameter Name="original_paytm" Type="String" />
                        <asp:Parameter Name="original_gpay" Type="String" />
                        <asp:Parameter Name="original_phonepe" Type="String" />
                        <asp:Parameter Name="original_mpn" Type="String" />
                        <asp:Parameter Name="original_isstarline" Type="String" />
                        <asp:Parameter Name="original_lastwithdrawn" Type="String" />
                        <asp:Parameter Name="original_lastwithdrawndate" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="otp" Type="String" />
                        <asp:Parameter Name="points" Type="String" />
                        <asp:Parameter Name="lastpoints" Type="String" />
                        <asp:Parameter Name="remainingpoints" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="accname" Type="String" />
                        <asp:Parameter Name="bankname" Type="String" />
                        <asp:Parameter Name="accnum" Type="String" />
                        <asp:Parameter Name="ifsc" Type="String" />
                        <asp:Parameter Name="paytm" Type="String" />
                        <asp:Parameter Name="gpay" Type="String" />
                        <asp:Parameter Name="phonepe" Type="String" />
                        <asp:Parameter Name="mpn" Type="String" />
                        <asp:Parameter Name="isstarline" Type="String" />
                        <asp:Parameter Name="lastwithdrawn" Type="String" />
                        <asp:Parameter Name="lastwithdrawndate" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="otp" Type="String" />
                        <asp:Parameter Name="points" Type="String" />
                        <asp:Parameter Name="lastpoints" Type="String" />
                        <asp:Parameter Name="remainingpoints" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="accname" Type="String" />
                        <asp:Parameter Name="bankname" Type="String" />
                        <asp:Parameter Name="accnum" Type="String" />
                        <asp:Parameter Name="ifsc" Type="String" />
                        <asp:Parameter Name="paytm" Type="String" />
                        <asp:Parameter Name="gpay" Type="String" />
                        <asp:Parameter Name="phonepe" Type="String" />
                        <asp:Parameter Name="mpn" Type="String" />
                        <asp:Parameter Name="isstarline" Type="String" />
                        <asp:Parameter Name="lastwithdrawn" Type="String" />
                        <asp:Parameter Name="lastwithdrawndate" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_phone" Type="String" />
                        <asp:Parameter Name="original_username" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_otp" Type="String" />
                        <asp:Parameter Name="original_points" Type="String" />
                        <asp:Parameter Name="original_lastpoints" Type="String" />
                        <asp:Parameter Name="original_remainingpoints" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_accname" Type="String" />
                        <asp:Parameter Name="original_bankname" Type="String" />
                        <asp:Parameter Name="original_accnum" Type="String" />
                        <asp:Parameter Name="original_ifsc" Type="String" />
                        <asp:Parameter Name="original_paytm" Type="String" />
                        <asp:Parameter Name="original_gpay" Type="String" />
                        <asp:Parameter Name="original_phonepe" Type="String" />
                        <asp:Parameter Name="original_mpn" Type="String" />
                        <asp:Parameter Name="original_isstarline" Type="String" />
                        <asp:Parameter Name="original_lastwithdrawn" Type="String" />
                        <asp:Parameter Name="original_lastwithdrawndate" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

