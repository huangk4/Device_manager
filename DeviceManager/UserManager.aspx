<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManager.aspx.cs" Inherits="DeviceManager.UserManager" %>

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



        .mGrid {
            z-index: 1;
            left: 166px;
            top: 232px;
            position: absolute;
            height: 334px;
            width: 600px;
            margin-top: 0px;
        }



    </style>
        <link rel="stylesheet" href="App_Start/Models/homeStyle.css" type="text/css" />
    <link rel="stylesheet" href="App_Start/Models/Button.css" type="text/css" />
</head>
<body background="BGpic.jpg">
    
    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
    </div>
    <form id="form1" runat="server">
        
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" BackColor="#66FFCC" BorderColor="#0099FF" BorderStyle="Double" Font-Size="X-Large">
            <StaticMenuItemStyle CssClass="menuStyle" /> 
                    <StaticHoverStyle CssClass="menuStyle" />
                    <DynamicMenuItemStyle CssClass="menusonStyle" /> 
            <Items>
                <asp:MenuItem Text="用户管理" Value="用户管理">
                    <asp:MenuItem Text="信息管理" Value="信息管理"></asp:MenuItem>
                    <asp:MenuItem Text="角色管理" Value="角色管理"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="角色管理" Value="角色管理">
                    <asp:MenuItem Text="信息管理" Value="信息管理"></asp:MenuItem>
                    <asp:MenuItem Text="权限管理" Value="权限管理"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="部门管理" Value="部门管理">
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        

                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" TableName="Admin" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" TableName="Department">
                </asp:LinqDataSource>
                <asp:Button ID="Button1" runat="server" BackColor="#3399FF" BorderColor="#6699FF" Font-Size="Medium" OnClick="Button1_Click" style="height: 26px; z-index: 1; left: 1136px; top: 227px; position: absolute" Text="返回" Visible="False" />
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" TableName="Role">
                </asp:LinqDataSource>
                <asp:GridView ID="GridView4" runat="server" CellPadding="4" DataSourceID="LinqDataSource2" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 613px; top: 246px; position: absolute; height: 164px; width: 455px; margin-left: 0px" Visible="False">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    <Columns>
                         <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbxId" runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>
                    </Columns>
        </asp:GridView>
                <asp:GridView ID="GridView3" runat="server" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" Height="332px" Width="850px" OnRowCommand="GridView3_RowCommand" style="z-index: 1; left: 418px; top: 315px; position: absolute; height: 332px; width: 850px" Visible="False">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    <Columns>
                        <asp:ButtonField CommandName="info" HeaderText="编辑查看" Text="详情" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                    </Columns>
        </asp:GridView>
                <asp:Button ID="Button3" runat="server" BackColor="#99FF66" OnClick="Button3_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" CellPadding="4" DataSourceID="LinqDataSource3" ForeColor="#333333" GridLines="None" Height="150px" style="z-index: 1; left: 426px; top: 330px; position: absolute; height: 150px; width: 387px" Visible="False" Width="387px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" Visible="False" 
                    style="position: absolute; top: 329px; left: 416px; z-index: 2; height: 142px; width: 547px;" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="LinqDataSource1">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
                <asp:GridView ID="GridView2" runat="server" Width="600px"
                    PagerStyle-CssClass="pgr"    
                    AlternatingRowStyle-CssClass="alt" GridLines="None" DataSourceID="LinqDataSource2" Visible="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" DataKeyNames="ID" style="z-index: 1; left: 415px; top: 309px; position: absolute; height: 334px; width: 600px">
                    <AlternatingRowStyle CssClass="alt" BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle CssClass="pgr" BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>
                                                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbxId" runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="角色名" HeaderText="角色名" SortExpression="角色名" />
                        <asp:BoundField DataField="角色描述" HeaderText="角色描述" SortExpression="角色描述" />

                    </Columns>
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="保存设置" Visible="False" BackColor="#66CCFF" BorderColor="#66FFFF" Font-Size="Medium" style="z-index: 1; left: 1138px; top: 223px; position: absolute" />

     
    </form>
</body>
</html>
