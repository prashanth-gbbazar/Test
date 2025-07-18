ABC
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Golden Bazar</title>
    <link rel="Shortcut icon" type="images/ico" href="fonts/logo1.jpg" />
    <meta charset="UTF-8" />
    <%--<link rel="Shortcut icon" type="image/ico" href="images/logo1.png" />--%>

    <link rel="stylesheet" type="text/css" href="Admin/style.css" />
</head>
<body>
    <form id="Form1" runat="server" style="margin-top:20px;">
      <img width="300" height="150" src="fonts/logo.jpg" />
        <h1 style="color: #888; font-size:x-large">GOLDEN BAZAR</h1>
        <div class="inset">
            <p>
                <label for="email">USERNAME</label>
                <input type="text" name="email" id="email" runat="server" style="color: white;" autocomplete="off" />
            </p>
            <p>
                <label for="password">PASSWORD</label>
                <input type="password" name="password" id="password" runat="server" style="color: white;" autocomplete="off" />
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </p>
        </div>
        <p class="p-container">
            <input type="submit" name="go" id="go" value="Log in" runat="server" onserverclick="go_ServerClick" />
            <br />
        </p>
        <span style="color:#777;">© 2020 Golden Bazar. All Rights Reserved</span>
    </form>
</body>
</html>
