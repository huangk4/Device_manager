<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetGoDownEntry.aspx.cs" Inherits="DeviceManager.SetGoDownEntry" %>

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
        <link rel="stylesheet" href="Models/homeStyle.css" type="text/css" />
    <link rel="stylesheet" href="Models/Button.css" type="text/css" />
</head>
<body background="BGpic.jpg">
    <form id="form1" runat="server">
        <div>
    

    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
    </div>
        </div>
        <asp:Label ID="Label1" runat="server" Font-Size="Large" style="z-index: 1; left: 548px; top: 267px; position: absolute" Text="资产名称："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 650px; top: 264px; position: absolute; height: 19px; width: 149px"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Font-Size="Large" style="z-index: 1; left: 823px; top: 268px; position: absolute" Text="是否为耗材："></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" style="z-index: 1; left: 932px; top: 266px; position: absolute; " Font-Size="Medium">
                <asp:ListItem>是</asp:ListItem>
                <asp:ListItem>否</asp:ListItem>
            </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Font-Size="Large" style="z-index: 1; left: 551px; top: 329px; position: absolute" Text="入库数量："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 651px; top: 327px; position: absolute; height: 18px; width: 150px"></asp:TextBox>
            <asp:Label ID="Label6" runat="server" Font-Size="Large" style="z-index: 1; left: 830px; top: 328px; position: absolute" Text="选择仓库："></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="LinqDataSource1" DataTextField="仓库名" DataValueField="仓库名" Font-Size="Medium" style="z-index: 1; left: 930px; top: 328px; position: absolute">
        </asp:DropDownList>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" Select="new (仓库名)" TableName="Warehouse">
        </asp:LinqDataSource>
            <asp:Button ID="Button3" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" style="z-index: 1; left: 550px; top: 382px; position: absolute; height: 28px; width: 81px;" Text="生成入库单" OnClick="Button3_Click" />
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
    </form>
</body>
</html>
