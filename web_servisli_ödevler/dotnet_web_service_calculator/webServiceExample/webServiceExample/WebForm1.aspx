<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="webServiceExample.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>deneme</title>
</head>
<body>
    <form id="form1" runat="server" action="Default.aspx">
        <asp:TextBox ID="firstNumberTextBox" runat="server"></asp:TextBox><br>
        <br />
        <asp:TextBox ID="secondNumberTextBox" runat="server"></asp:TextBox><br>
        <br />
        <asp:TextBox ID="operationTextBox" runat="server"></asp:TextBox><br>
        <br />
        <asp:Button ID="webCalculateButton" runat="server" Text="Calculate" OnClick="Page_Load"/><br />
        <asp:Label ID="resultLabel" runat="server" Text="Result"></asp:Label>
    </form>
</body>
</html>
