<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h3><b>Account Settings</b></h3>
        <div class="col-md-4">
            <label>Username</label>
            <asp:TextBox ID="txtun" runat="server" class="form-control" placeholder="Enter Username" />
            <br />
            <label>Your Password</label>
            <asp:TextBox ID="txtpw" runat="server" class="form-control" placeholder="Enter New Password" />
            <br />
            <asp:Button ID="btnsubmit" runat="server" class="btn btn-success" OnClick="btnsubmit_Click" Width="100%" Height="38" Text="Update" />
        </div>
    </div>
</asp:Content>

