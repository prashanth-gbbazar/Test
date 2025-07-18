<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="udownloads.aspx.cs" Inherits="udownloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="gvsprovider" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="gvsprovider_PageIndexChanging" CssClass="table table-bordered table-hover table-striped"
                    EmptyDataText="No Downloads &#128542;" EmptyDataRowStyle-BackColor="#B0B5C0" EmptyDataRowStyle-Font-Bold="true" Caption="App Downloads">
                    <HeaderStyle CssClass="header" BackColor="#151517"
                        Font-Bold="True" ForeColor="White" />
                    <PagerStyle CssClass="gridview"></PagerStyle>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>