<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="gérerservice.aspx.cs" Inherits="StayEsay.View.Administrateur.gérerservice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />

    <style>     .center-grid {
  margin-left: auto;
  margin-right: auto;
}
     .large-grid {
  width: 90%;
}</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br /><br />
    <h3 style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Liste complète des hotels</h3>
<asp:GridView ID="GridView1"   CssClass="large-grid  center-grid"  runat="server" AutoGenerateColumns="False" style="margin-left: auto; margin-right: auto;" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
    <Columns>
        <asp:BoundField DataField="Idhotel" HeaderText="ID" />
        <asp:BoundField DataField="nom" HeaderText="Nom" />
          <asp:BoundField DataField="description" HeaderText="description" />
        <asp:BoundField DataField="categorie" HeaderText="categorie" />
        <asp:BoundField DataField="adresse" HeaderText="adresse" />
      
        <asp:TemplateField HeaderText="img1">
            <ItemTemplate>
                <asp:Image ID="img1" runat="server" Height="50px" Width="50px" ImageUrl='<%# GetImageUrl(Eval("imgsupp1")) %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="img2">
            <ItemTemplate>
                <asp:Image ID="img2" runat="server" Height="50px" Width="50px" ImageUrl='<%# GetImageUrl(Eval("imgsupp2")) %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="img3">
            <ItemTemplate>
                <asp:Image ID="img3" runat="server" Height="50px" Width="50px" ImageUrl='<%# GetImageUrl(Eval("imgsupp3")) %>' />
            </ItemTemplate>
        </asp:TemplateField>

       <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:DropDownList ID="ddlActions" runat="server">
             <asp:ListItem Text="En attente " Value="#"></asp:ListItem>
            <asp:ListItem Text="Accepter" Value="Accepter"></asp:ListItem>
            <asp:ListItem Text="Refuser" Value="Refuser"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnModifier" runat="server" Text="Modifier" CommandName="Modifier" CommandArgument='<%# Eval("Idhotel") %>' OnCommand="btnAction_Command" />
    </ItemTemplate>
</asp:TemplateField>


    </Columns>
    <FooterStyle BackColor="White" ForeColor="#ecabb5" />
    <HeaderStyle BackColor="#ecabb5" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>



</asp:Content>
