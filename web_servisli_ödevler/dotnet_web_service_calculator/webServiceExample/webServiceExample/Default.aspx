<%@ Page Title="Web Calculator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webServiceExample._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br><br>
    <form id="calculate_form">
        <asp:TextBox ID="firstNumberTextBox" runat="server"></asp:TextBox><br>
        <br />
        <asp:TextBox ID="secondNumberTextBox" runat="server"></asp:TextBox><br>
        <br />
        <asp:TextBox ID="operationTextBox" runat="server"></asp:TextBox><br>
        <br />
        <asp:Button ID="WebCalculateButton" runat="server" Text="Calculate" OnClick="WebCalculateButton_Click"/><br />
        <asp:Label ID="resultLabel" runat="server" Text="Result"></asp:Label>
    </form>

</asp:Content>
