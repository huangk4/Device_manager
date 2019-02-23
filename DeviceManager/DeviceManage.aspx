<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeviceManage.aspx.cs" Inherits="DeviceManager.DeviceManage" %>

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
    
    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
    </div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EnableInsert="True" EntityTypeName="" TableName="Device" Where="是否耗材 == @是否耗材">
            <WhereParameters>
                <asp:Parameter DefaultValue="否" Name="是否耗材" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="X-Large" ForeColor="#284E98" StaticSubMenuIndent="10px" OnMenuItemClick="Menu1_MenuItemClick">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem Text="资产新增" Value="资产新增"></asp:MenuItem>
                <asp:MenuItem Text="资产退出" Value="新建项"></asp:MenuItem>
                <asp:MenuItem Text="资产维护" Value="资产维护">
                </asp:MenuItem>
                <asp:MenuItem Text="资产转移" Value="资产转移">
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
            <asp:Button ID="Button9" runat="server" BackColor="#99FF66" OnClick="Button9_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
        <asp:Label ID="Label1" runat="server" Font-Size="Large" style="z-index: 1; left: 1016px; top: 339px; position: absolute; height: 25px; width: 91px; right: 103px;" Text="退出原因：" Visible="False"></asp:Label>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" TableName="Warehouse">
        </asp:LinqDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" Height="225px" style="z-index: 1; left: 389px; top: 300px; position: absolute; height: 225px; width: 604px" Width="604px" Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbxId" runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="资产名称" HeaderText="资产名称" SortExpression="资产名称" />
                <asp:BoundField DataField="简称" HeaderText="简称" SortExpression="简称" />
                <asp:BoundField DataField="所属仓库" HeaderText="所属仓库" SortExpression="所属仓库" />
                <asp:BoundField DataField="存量" HeaderText="存量" SortExpression="存量" />
                <asp:BoundField DataField="是否耗材" HeaderText="是否耗材" SortExpression="是否耗材" />
                <asp:BoundField DataField="折旧状态" HeaderText="折旧状态" SortExpression="折旧状态" />
                <asp:BoundField DataField="借出状态" HeaderText="借出状态" SortExpression="借出状态" />
                <asp:BoundField DataField="借出信息" HeaderText="借出信息" SortExpression="借出信息" />
            </Columns>
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
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 515px; top: 275px; position: absolute; height: 279px; width: 379px" Visible="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="资产名称" HeaderText="资产名称" SortExpression="资产名称" />
                <asp:BoundField DataField="简称" HeaderText="简称" SortExpression="简称" />
                <asp:BoundField DataField="所属仓库" HeaderText="所属仓库" SortExpression="所属仓库" />
                <asp:BoundField DataField="存量" HeaderText="存量" SortExpression="存量" />
                <asp:BoundField DataField="是否耗材" HeaderText="是否耗材" SortExpression="是否耗材" />
                <asp:BoundField DataField="折旧状态" HeaderText="折旧状态" SortExpression="折旧状态" />
                <asp:BoundField DataField="借出状态" HeaderText="借出状态" SortExpression="借出状态" />
                <asp:BoundField DataField="借出信息" HeaderText="借出信息" SortExpression="借出信息" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:Button ID="Button1" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" OnClick="Button1_Click" style="z-index: 1; left: 1016px; top: 306px; position: absolute" Text="折旧" Visible="False" Font-Size="Large"/>
        <asp:Button ID="Button2" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" OnClick="Button2_Click" style="z-index: 1; left: 1016px; top: 331px; position: absolute" Text="维修" Visible="False" Font-Size="Large"/>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Font-Size="Large" style="z-index: 1; left: 1111px; top: 334px; position: absolute" Visible="False">
            <asp:ListItem>过期</asp:ListItem>
            <asp:ListItem>损坏</asp:ListItem>
            <asp:ListItem>丢失</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button3" runat="server" BackColor="#99FF99" BorderColor="#CCFFFF" OnClick="Button3_Click" style="z-index: 1; left: 1013px; top: 299px; position: absolute" Text="资产退出" Visible="False" Font-Size="Large" />
        <asp:Button ID="Button4" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" OnClick="Button4_Click" style="z-index: 1; left: 590px; top: 255px; position: absolute; height: 29px; width: 62px" Text="领用" Visible="False" Font-Size="Large" />
        <asp:Button ID="Button5" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" OnClick="Button5_Click" style="z-index: 1; left: 897px; top: 254px; position: absolute" Text="产权变更" Visible="False" Font-Size="Large" />
        <asp:Button ID="Button7" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" OnClick="Button7_Click" style="z-index: 1; left: 784px; top: 254px; position: absolute" Text="资产归还" Visible="False" Font-Size="Large" />
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="LinqDataSource2" DataTextField="仓库名" DataValueField="仓库名" Font-Size="Large" style="z-index: 1; left: 1110px; top: 301px; position: absolute" Visible="False">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Font-Size="Large" style="z-index: 1; left: 1017px; top: 299px; position: absolute; height: 25px; width: 92px; right: 101px" Text="转移仓库：" Visible="False"></asp:Label>
        <asp:Button ID="Button8" runat="server" BackColor="#99FF99" BorderColor="#CCFFCC" OnClick="Button8_Click" style="z-index: 1; left: 671px; top: 255px; position: absolute" Text="资产借出" Font-Size="Large" Visible="False" />
    </form>
</body>
</html>
