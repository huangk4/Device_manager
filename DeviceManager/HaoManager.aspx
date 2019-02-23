<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HaoManager.aspx.cs" Inherits="DeviceManager.HaoManager" %>

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



        </style>
</head>
<body background="BGpic.jpg">
    <form id="form1" runat="server">
        <div>
    
    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
    </div>
        </div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" Select="new (资产名称, 存量)" TableName="Device" Where="所属仓库 == @所属仓库 &amp;&amp; 是否耗材 == @是否耗材">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="总库" Name="所属仓库" SessionField="Warehouse" Type="String" />
                <asp:Parameter DefaultValue="是" Name="是否耗材" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
        <asp:Button ID="Button1" runat="server" BackColor="#99FF99" BorderColor="#99FFCC" style="z-index: 1; left: 596px; top: 410px; position: absolute; height: 25px; width: 59px" Text="领取" />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="LinqDataSource1" DataTextField="资产名称" DataValueField="资产名称" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="z-index: 1; left: 697px; top: 271px; position: absolute; " Font-Size="Large">
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 597px; top: 275px; position: absolute" Text="选择耗材：" Font-Size="Large"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 598px; top: 317px; position: absolute; bottom: 142px;" Text="耗材余量：" Font-Size="Large"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; top: 319px; position: absolute; left: 696px" Font-Size="Large"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 598px; top: 363px; position: absolute" Text="领取数量：" Font-Size="Large"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 695px; top: 358px; position: absolute; height: 22px;"></asp:TextBox>
    </form>
</body>
</html>
