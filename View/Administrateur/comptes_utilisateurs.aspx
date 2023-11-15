<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="comptes_utilisateurs.aspx.cs" Inherits="StayEsay.View.Administrateur.comptes_utilisateurs" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet"/>
     <!-- Page -->
    <link rel="stylesheet" href="../../Asset/vendor/css/pages/page-auth.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <!-- Content -->
    <body>
    <div class="container-xxl" style="text-align:center">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
                <div class="app-brand justify-content-center">
                    <a href="#" class="app-brand-link gap-2">
                        <img src="../../Asset/images/dashbord/add2.gif" style="width: 150px" />
                    </a>
                </div>
              <!-- /Logo -->
              <h4 class="mb-2"> </h4>
             
              <form >
                 <div class="mb-3">
                  <label for="Nom utilisateur" class="form-label">Nom d'utilisateur</label>
                  <input type="text" class="form-control" id="txtNomcomplet" name="email" placeholder="Enter votre Nom" runat="server" />
                </div>


               <div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="Email" class="form-control" id="txtEmail" name="email" placeholder="Enter votre email" runat="server"  required/>
</div>

                <div class="mb-3">
                  <label for="Mot" class="form-label">Mot de passe</label>
                  <input type="password" class="form-control" id="txtMdp" name="Mot"  runat="server" 
                      pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:])([^\s]){8,16}$"
                        title="Le mot de passe doit contenir entre 8 et 16 caractères, au moins une majuscule, une minuscule, un chiffre et un caractère spécial."
      required />
                </div>
                   <div class="mb-3">
                  <label for="email" class="form-label">Telephone</label>
                  <input type="text" class="form-control"  id="txtTel" name="tel" placeholder="Enter votre telephone" runat="server"  pattern="^[2,3,5,7,9]\d{7}$" required />
                </div>
                    <div class="mb-3">
                  <label for="adresse" class="form-label">Adresse</label>
                  <input type="text" class="form-control" id="txtAdresse" name="email" placeholder="Enter votre adresse" runat="server" required />
                </div>
              
                  <label runat="server" id="ErrMsg" class="text-danger"></label>
                  <br />
                  <asp:Button ID="AddBtn" runat="server" Text="Ajouter" class="btn btn-success"  OnClick="AddBtn_Click"/> 
                  <asp:Button ID="edit" runat="server" Text="Modifier" class="btn btn-warning" OnClick="edit_Click" /> 
                   <asp:Button ID="Delete" runat="server" Text="Supprimer" class="btn btn-danger"  OnClick="Delete_Click" /> 

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
        <div class="row">
            <div class="col">
                <h1 style="color: #5D54A4 ; text-align: center ; font-family: 'Medula One', cursive; " >Liste complète des utilisateurs</h1>
               <asp:GridView runat="server"  AutoGenerateColumns="False" class="table table-hover" ID="UtilisateurA" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateSelectButton="True" OnSelectedIndexChanged="UtilisateurA_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" />
        <asp:BoundField DataField="NomComplet" HeaderText="NomComplet" />
         <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField HeaderText="Mdp">
            <ItemTemplate>
                <asp:Label ID="Mdp" runat="server" Text="****"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:BoundField DataField="Telephone" HeaderText="Telephone" />
       <asp:BoundField DataField="Adresse" HeaderText="Adresse" />
    </Columns>
</asp:GridView>

                </div>
            </div>
</body>
    <!-- / Content -->
</asp:Content>
