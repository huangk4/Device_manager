<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetContract.aspx.cs" Inherits="DeviceManager.SetContract" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

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
        <asp:Label ID="Label1" runat="server" Font-Size="Large" style="z-index: 1; left: 413px; top: 248px; position: absolute" Text="合同名："></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Size="Large" style="z-index: 1; left: 402px; top: 311px; position: absolute" Text="交易资产："></asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Size="Large" style="z-index: 1; left: 405px; top: 386px; position: absolute" Text="生效时间："></asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Size="Large" style="z-index: 1; left: 811px; top: 387px; position: absolute" Text="是否为耗材："></asp:Label>
            <asp:Label ID="Label6" runat="server" Font-Size="Large" style="z-index: 1; left: 832px; top: 245px; position: absolute; bottom: 288px;" Text="供货商："></asp:Label>
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Large" style="z-index: 1; left: 404px; top: 463px; position: absolute; right: 481px;" Text="终止时间："></asp:Label>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" TableName="Contract">
        </asp:LinqDataSource>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 523px; top: 244px; position: absolute; height: 19px; width: 259px"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 522px; top: 309px; position: absolute; height: 18px; width: 261px"></asp:TextBox>
            <asp:DropDownList ID="DropDownList2" runat="server" style="z-index: 1; left: 929px; top: 387px; position: absolute">
                <asp:ListItem>是</asp:ListItem>
                <asp:ListItem>否</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
        </p>
        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 522px; top: 385px; position: absolute; height: 19px; width: 264px"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 521px; top: 459px; position: absolute; height: 19px; width: 270px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 820px; top: 443px; position: absolute" Text="确定生成" class="button blue bigrounded" OnClick="Button1_Click"/>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="供货商" DataValueField="供货商" style="z-index: 1; left: 928px; top: 246px; position: absolute">
            </asp:DropDownList>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请勿输入非法字符" style="z-index: 1; left: 525px; top: 218px; position: absolute" ValidationExpression="^[\u4e00-\u9fa5_a-zA-Z0-9]+$"></asp:RegularExpressionValidator>
    </form>
</body>
</html>
