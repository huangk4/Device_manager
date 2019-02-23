<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="DeviceManager.info" %>

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


h1{
    font-size:100%;
    font-size:50px;
    padding:0;
    margin:0;
    height: 50px;
    width: 945px;
}


    .mGrid {
    width: 983px;
    background-color: aquamarine;
    margin: 5px 0 10px 0;
    border: solid 1px #525252;
    border-collapse: collapse;
    z-index: 1;
    left: 216px;
    top: 171px;
    position: absolute;
    height: 205px;
}

    .mGrid th {
        padding: 4px 2px;
        color: #fff;
        background: cadetblue url('App_Data/grd_head.png') repeat-x 50% top;
        border-left: solid 1px #525252;
        font-size: 0.9em;
    }

    .mGrid .alt {
        background: #fcfcfc url('App_Data/grd_alt.png') repeat-x 50% top;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    
    <div class="headtitle">
        <h1>医院固定资产管理系统</h1>
    </div>
        </div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DeviceManager.DataClasses1DataContext" EntityTypeName="" OrderBy="发生时间 desc" TableName="Bulletin">
        </asp:LinqDataSource>
            <asp:Button ID="Button2" runat="server" BackColor="#99FF66" OnClick="Button2_Click" style="z-index: 1; right:68px; top: 121px; position: absolute; height: 27px; width: 83px" Text="返回主页" />
                <asp:GridView ID="GridView1" runat="server" 
                    CssClass="mGrid"    
                    PagerStyle-CssClass="pgr"    
                    AlternatingRowStyle-CssClass="alt" GridLines="None" DataSourceID="LinqDataSource1" AutoGenerateColumns="False" DataKeyNames="id">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="消息种类" HeaderText="消息种类" SortExpression="消息种类" />
                        <asp:BoundField DataField="详细信息" HeaderText="详细信息" SortExpression="详细信息" />
                        <asp:BoundField DataField="发生时间" HeaderText="发生时间" SortExpression="发生时间" />
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>
    </form>
</body>
</html>
