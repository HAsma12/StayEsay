<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="repashotel.aspx.cs" Inherits="StayEsay.View.Fournisseur.repashotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Asset/css/repashotel.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="left">
            <div class="header">
                <h2 class="animation a1">Ajouter  des Repas</h2>
                <h4 class="animation a2"></h4>
            </div>
            <div class="form">
                <input type="text" class="form-field animation a3" id="txtnomrepas" placeholder="Nom du Repas"  runat="server"/>
                <input type="text" class="form-field animation a4" id="txttarif" placeholder="Tarif par Personne"  runat="server" />

                <p class="#"><a href="#"></a></p>
               <label runat="server" id="ErrMsg" class="text-info"></label>
                <label runat="server" id="Label1" class="text-danger"></label>
             <div style="display: flex; justify-content: center; align-items: center;">
    <asp:Button ID="AddBtn" class="animation a6" runat="server" Text="Ajouter" OnClick="AddBtn_Click"
        Style="padding: 12px 10px; background: linear-gradient(to right, #de48b5 0%, #0097ff 100%); color: #fff; border: 0; font-family: sans-serif; width:120px; margin-right: 10px;" />

    <asp:Button ID="EditBtn" class="animation a6" runat="server" Text="Modifier" OnClick="EditBtn_Click"
        Style="padding: 12px 10px; background: linear-gradient(to right, #de48b5 0%, #0097ff 100%); color: #fff; border: 0; font-family: sans-serif; width:120px; margin-left: 10px;" />

<asp:Button ID="Delete" class="animation a6" runat="server" Text="Supprimer" OnClick="Delete_Click"
        Style="padding: 12px 10px; background: linear-gradient(to right, #de48b5 0%, #0097ff 100%); color: #fff; border: 0; font-family: sans-serif; width:120px; margin-left: 10px;" />

</div>

            </div>
        </div>
        <div class="right"></div>
    </div>
<%--        <asp:GridView runat="server" class="table table-hover" ID="repas" AutoGenerateSelectButton="True" OnSelectedIndexChanged="repas_SelectedIndexChanged"></asp:GridView>--%>





      <asp:GridView runat="server" class="table table-hover" ID="repas" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="repas_SelectedIndexChanged">
                    <Columns>
                         <asp:BoundField DataField="IdTarifRepas" HeaderText="IdTarifRepas" />
                        <asp:BoundField DataField="NomRepas" HeaderText="NomRepas" />
                        <asp:BoundField DataField="Tarif" HeaderText="Tarif" />
                    
                        
                    </Columns>
                </asp:GridView>
</asp:Content>
