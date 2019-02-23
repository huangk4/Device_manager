<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetRequirement.aspx.cs" Inherits="DeviceManager.SetRequirement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
            <link rel="stylesheet" href="App_Start/Models/homeStyle.css" type="text/css" />
    <link rel="stylesheet" href="App_Start/Models/Button.css" type="text/css" />
    <style type="text/css">




.headtitle{
    color:white;
    background-color:cadetblue;
    height:80px;
    padding-top:10px;
    padding-left:10px;
}



    .blue {
    color: #d9eef7;
    border: solid 1px #0076a3;
    background: #0095cd;
    background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
    background: -moz-linear-gradient(top, #00adee, #0078a5);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}

    .bigrounded {
    -webkit-border-radius: 2em;
    -moz-border-radius: 2em;
    border-radius: 2em;
}

.button {
    display: inline-block;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 16px/100% 'Microsoft yahei',Arial, Helvetica, sans-serif;
    padding: .5em 2em .55em;
    text-shadow: 0 1px 1px rgba(0,0,0,.3);
    -webkit-border-radius: .5em;
    -moz-border-radius: .5em;
    border-radius: .5em;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    box-shadow: 0 1px 2px rgba(0,0,0,.2);
    margin:10px
}

    

    </style>
</head>
<body background="BGpic.jpg">

    <form id="form1" runat="server">
        <div>
    
    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceManagerConnectionString %>" SelectCommand="SELECT [供货商], [交易资产], [是否耗材], [审核状态] FROM [Contract] WHERE ([审核状态] = @审核状态)">
            <SelectParameters>
                <asp:Parameter DefaultValue="是" Name="审核状态" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
    </div>
        </div>
        <asp:DropDownList ID="DropDownList3" runat="server" style="z-index: 1; left: 564px; top: 228px; position: absolute; right: 333px;" DataSourceID="SqlDataSource1" DataTextField="交易资产" DataValueField="交易资产">
        </asp:DropDownList>
        <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 459px; top: 339px; position: absolute" Text="需求数量："></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 462px; top: 230px; position: absolute" Text="选择需求："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 567px; top: 332px; position: absolute; height: 18px; width: 122px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 412px; top: 399px; position: absolute" Text="确定提交" class="button blue bigrounded" OnClick="Button1_Click"/>
    </form>
</body>
</html>
