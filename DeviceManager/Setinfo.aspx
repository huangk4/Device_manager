<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setinfo.aspx.cs" Inherits="DeviceManager.Setinfo" %>

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
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EnableUpdate="True" EntityTypeName="" Select="new (用户名, 密码, 姓名, 联系方式)" TableName="Admin" Where="用户名 == @用户名">
            <WhereParameters>
                <asp:SessionParameter Name="用户名" SessionField="User" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" AutoGenerateRows="False" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 448px; top: 256px; position: absolute; height: 204px; width: 330px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="用户名" HeaderText="用户名" ReadOnly="True" SortExpression="用户名" />
                <asp:BoundField DataField="密码" HeaderText="密码" ReadOnly="True" SortExpression="密码" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" ReadOnly="True" SortExpression="姓名" />
                <asp:BoundField DataField="联系方式" HeaderText="联系方式" ReadOnly="True" SortExpression="联系方式" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </form>
</body>
</html>
