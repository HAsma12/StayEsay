<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="comptes_fournisseurs.aspx.cs" Inherits="StayEsay.View.Administrateur.comptes_fournisseurs" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />

    <link rel="stylesheet" href="../../Asset/vendor/css/pages/page-auth.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content -->

    <div class="container-xxl" style="text-align: center">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner">
                <!-- Register Card -->
                <div class="card">
                    <div class="card-body">
                        <!-- Logo -->
                        <div class="app-brand justify-content-center">
                            <a href="#" class="app-brand-link gap-2">
                                <img src="../../Asset/images/dashbord/welcome.gif" style="width: 96px" />
                            </a>
                        </div>
                        <!-- /Logo -->
                        <h4 class="mb-2">devenir fournisseur 🚀</h4>

                        <form>
                            <div class="mb-3">
                                <label for="Nom utilisateur" class="form-label">Nom Fournisseur</label>
                                <input type="text" class="form-control" id="txtNomcomplet" name="nom" placeholder="Entrez Nom du fournisseur " runat="server"  required/>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="Email" class="form-control" id="txtEmail" name="email" placeholder="Entrez l'email du fournisseur" runat="server" required />
                            </div>


                            <div class="mb-3">
                                <label for="Mot" class="form-label">Mot de passe</label>
                                <input type="password" class="form-control" id="txtMdp" name="Mot" runat="server"      pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:])([^\s]){8,16}$"
                        title="Le mot de passe doit contenir entre 8 et 16 caractères, au moins une majuscule, une minuscule, un chiffre et un caractère spécial."
      required />
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="txtTel" name="email" placeholder="Entrez telephone du fournisseur" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="adresse" class="form-label">Adresse</label>
                                <input type="text" class="form-control" id="txtAdresse" name="email" placeholder="Entrez adresse du fournisseur" runat="server" />
                            </div>
                            <br />
                            <label for="type_service">Type de service proposé :</label>
                            <select name="type_service" id="type_service" style="width: 350px" runat="server">
                                <option value="restaurant">Restaurant 🍴</option>
                                <option value="hotel">Hôtel 🏨</option>
                                <option value="spa">Spa</option>
                            </select>
                            <br />
                            <br />

                            <label runat="server" id="ErrMsg" class="text-danger"></label>
                            <br />
                            <asp:Button ID="AddBtn" runat="server" Text="Ajouter" class="btn btn-success" OnClick="AddBtn_Click" />
                            <asp:Button ID="EditBtn" runat="server" Text="Modifier" class="btn btn-warning" OnClick="EditBtn_Click" />
                            <asp:Button ID="DeleteBtn" runat="server" Text="Supprimer" class="btn btn-danger" OnClick="DeleteBtn_Click" />
                        </form>
                        <p class="text-center">
                            <span></span>
                            <a href="#">
                                <span></span>
                            </a>
                        </p>
                    </div>
                </div>
                <!-- Register Card -->
            </div>
        </div>
    </div>
    <h1 style="color: #5D54A4; text-align: center; font-family: 'Medula One', cursive;">Liste complète des fournisseurs</h1>
<%--    <asp:GridView runat="server" class="table table-hover" ID="FournisseurA" AutoGenerateSelectButton="True" OnSelectedIndexChanged="FournisseurA_SelectedIndexChanged"></asp:GridView>--%>












   <asp:GridView runat="server"  AutoGenerateColumns="False" class="table table-hover" ID="FournisseurA"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateSelectButton="True" OnSelectedIndexChanged="FournisseurA_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" />
        <asp:BoundField DataField="NomComplet" HeaderText="NomComplet" />
         <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField HeaderText="Mdp">
            <ItemTemplate>
                <asp:Label ID="Mdp" runat="server" Text="****"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:BoundField DataField="Tel" HeaderText="Tel" />
        <asp:BoundField DataField="adresse" HeaderText="adresse" />
       <asp:BoundField DataField="typeservice" HeaderText="typeservice" />
    </Columns>
</asp:GridView>

</asp:Content>
