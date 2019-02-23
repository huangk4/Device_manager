<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DeviceManager.App_Start.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="Models/homeStyle.css" type="text/css" />
    <link rel="stylesheet" href="Models/Button.css" type="text/css" />
    <style type="text/css">
        body{background:url(BGpic.jpg)}
        #form1 {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    

    <div class="headtitle">
        <h1>医院固定资产管理系统<asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" style="z-index: 1; right:100px; top: 29px; position: absolute" OnClick="LinkButton1_Click">账号管理</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Medium" style="z-index: 1; right:30px;top: 29px; position: absolute" OnClick="LinkButton2_Click">注销登录</asp:LinkButton>
        </h1>
    </div>
        <asp:Button ID="Button4" runat="server" Text="建立合同" class="button blue bigrounded" OnClick="Button4_Click"/>
        <asp:Button ID="Button5" runat="server" Text="建立需求" class="button blue bigrounded" OnClick="Button5_Click"/>
        <asp:Button ID="Button6" runat="server" Text="建立订单" class="button green bigrounded" OnClick="Button6_Click"/>
        <asp:Button ID="Button7" runat="server" Text="建立入库单" class="button green bigrounded" OnClick="Button7_Click"/>
        <br />
                
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 295px; top: 196px; position: absolute; height: 20px" Visible="False"></asp:Label>
                
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="系统管理" class="button white bigrounded"/>
        <asp:Button ID="Button10" runat="server" Text="系统提醒" class="button white bigrounded" OnClick="Button10_Click"/>
        <asp:Button ID="Button8" runat="server" Text="耗材管理"  class="button orange bigrounded" OnClick="Button8_Click"/>
        <asp:Button ID="Button9" runat="server" Text="资产管理" class="button orange bigrounded" OnClick="Button9_Click" />
    

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请不要输入非法字符" ValidationExpression="^[\u4e00-\u9fa5_a-zA-Z0-9]+$"></asp:RegularExpressionValidator>
    

        
    

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 1211px; top: 268px; position: absolute; height: 35px; width: 94px;"  CssClass="blue" OnClick="Button1_Click1" Visible="False"/>
                <br />
                <br />
                <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" >
                    <StaticMenuItemStyle CssClass="menuStyle" BackColor="White" /> 
                    <StaticHoverStyle CssClass="menuStyle" BackColor="White" />
                    <DynamicMenuItemStyle CssClass="menusonStyle" /> 
                    <Items>
                        <asp:MenuItem Text="供货商与合同" Value="供货商与合同">
                            
                            <asp:MenuItem Text="供货商管理" Value="供货商管理" ></asp:MenuItem>
                            <asp:MenuItem Text="审核合同" Value="审核合同"></asp:MenuItem>
                            <asp:MenuItem Text="查询合同" Value="查询合同"></asp:MenuItem>
                            
                        </asp:MenuItem>
                        <asp:MenuItem Text="订单" Value="订单">
                            <asp:MenuItem Text="订单查询" Value="订单查询"></asp:MenuItem>
                            <asp:MenuItem Text="订单统计" Value="订单统计"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="入库单" Value="入库单">
                            <asp:MenuItem Text="入库单查询" Value="入库单查询"></asp:MenuItem>
                            <asp:MenuItem Text="入库单统计" Value="入库单统计"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="质量检测" Value="质量检测">
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
                <asp:Button ID="Button2" runat="server" CssClass="orange" style="z-index: 1; left: 942px; top: 218px; position: absolute; height: 25px; width: 70px; right: 163px;" Text="搜索" OnClick="Button2_Click" Visible="False" />
                <br />
                
                <asp:GridView ID="GridView2" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="id"
                    CssClass="mGrid"    
                    PagerStyle-CssClass="pgr"    
                    AlternatingRowStyle-CssClass="alt" GridLines="None" Visible="False">
                    <AlternatingRowStyle CssClass="alt" />
                    <PagerStyle CssClass="pgr" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbxId" runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView1" runat="server" 
                    CssClass="mGrid"    
                    PagerStyle-CssClass="pgr"    
                    AlternatingRowStyle-CssClass="alt" GridLines="None" DataSourceID="LinqDataSource1" Visible="False">
                    <AlternatingRowStyle CssClass="alt" />
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateDeleteButton="True" 
                    AutoGenerateEditButton="True" AutoGenerateInsertButton="True" DataSourceID="LinqDataSource1" Width="900px" DataKeyNames="ID" Visible="False" 
                    style="position: absolute; top: 270px; left: 301px; z-index: 2; height: 142px; width: 547px;" CellPadding="4" ForeColor="#333333" GridLines="None"
                    >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Supplier">
                </asp:LinqDataSource>
                <asp:TextBox ID="TextBox1" runat="server" Height="21px" style="z-index: 1; left: 575px; top: 216px; position: absolute; margin-top: 0px; width: 363px;" Visible="False"></asp:TextBox>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </form>


</body>
</html>
