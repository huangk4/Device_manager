<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetOrder.aspx.cs" Inherits="DeviceManager.SetOrder" %>

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
                
                <asp:GridView ID="GridView2" runat="server" DataSourceID="LinqDataSource1"
                    CssClass="mGrid"    
                    PagerStyle-CssClass="pgr"    
                    AlternatingRowStyle-CssClass="alt" GridLines="None" AutoGenerateColumns="False">
                    <AlternatingRowStyle CssClass="alt" />
                    <PagerStyle CssClass="pgr" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbxId" runat="Server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="需求资产" HeaderText="需求资产" ReadOnly="True" SortExpression="需求资产" />
                        <asp:BoundField DataField="需求数量" HeaderText="需求数量" ReadOnly="True" SortExpression="需求数量" />
                        <asp:BoundField DataField="供货商" HeaderText="供货商" ReadOnly="True" SortExpression="供货商" />
                    </Columns>
                </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="生成订单" BackColor="#3399FF" Font-Size="Medium" Height="33px" style="z-index: 1; left: 1213px; top: 269px; position: absolute" Width="101px" OnClick="Button1_Click1" />
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" Select="new (需求资产, 需求数量, 供货商)" TableName="SetOrder">
        </asp:LinqDataSource>
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
    </form>
</body>
</html>
