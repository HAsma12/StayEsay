<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="consulterreservations.aspx.cs" Inherits="StayEsay.View.Fournisseur.consulterreservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .center-grid {
  margin-left: auto;
  margin-right: auto;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center" style="color: #f6bf9f;  text-align: center; font-family: 'Medula One', cursive;">Réservations Clients</h1>
    <br />
<asp:GridView ID="consulterReservations" runat="server" AutoGenerateColumns="False" CssClass="center-grid" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="Idrestaurant" HeaderText="ID de restaurant" />
        <asp:BoundField DataField="nom" HeaderText="nom de restaurant" />
        <asp:BoundField DataField="IdReservation" HeaderText="ID de réservation" />
        <asp:BoundField DataField="NomComplet" HeaderText="Nom de utilisateur " />
        <asp:BoundField DataField="Telephone" HeaderText="Téléphone" />
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:BoundField DataField="Temps" HeaderText="Temps" />
    </Columns>
    <EditRowStyle BackColor="#ecabb5" />
    <FooterStyle BackColor="#ecabb5" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#ecabb5" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#ecabb5" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>



</asp:Content>


