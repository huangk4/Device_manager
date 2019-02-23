<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DeviceManager.App_Start.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">




.headtitle{
    color:white;
    background-color:cadetblue;
    height:80px;
    padding-top:10px;
    padding-left:10px;
}

h1{
    font-size:100%;
    font-size:50px;
    padding:0;
    margin:0;
    height: 50px;
    width: 945px;
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="Medium" ForeColor="#333333" Height="151px" style="z-index: 1; left: 604px; top: 250px; position: absolute; height: 161px; width: 230px" Width="220px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
    
    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
    </div>
    </form>
</body>
</html>
