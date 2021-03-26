<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="EjemploAJAX.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ejemplo AJAX</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
        <ContentTemplate>
            <br />
            <asp:Button runat="server" ID="btnHelloWorld"
                           OnClick="btnHelloWorld_Click"
                           Text="Llenar tabla" />
            <br />
            <br />
            <asp:GridView ID="dgvTabla" runat="server"></asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
