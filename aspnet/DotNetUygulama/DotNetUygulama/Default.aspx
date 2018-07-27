<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DotNetUygulama._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        function ChangeBaslik() {
            var txtBiseyler_js = document.getElementById("txtBiseyler");
            alert( txtBiseyler_js.value );
        }

    </script>
    547

    <div class="jumbotron">
        <table id="employees_table">
            <% foreach (var myItem in EmployeeNameList) { %>
                <tr>
                    <td><%= myItem %></td>
                </tr>
            <% } %>
        </table>
        <asp:TextBox runat="server" ID="txtBiseyler" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
        <asp:Button runat="server" ID="btnSend" CssClass="btn btn-primary"  onClientClick="ChangeBaslik()" ClientIDMode="Static"/>
        <asp:Label runat="server" ID="lblText"></asp:Label>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
