<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="gere_profil.aspx.cs" Inherits="StayEsay.View.Fournisseur.gere_profil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
                <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span> Account</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                      <li class="nav-item">
                          <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>Account</a>
                      </li>      
                  </ul>
                  <div class="card mb-4">
                    <h5 class="card-header">Détails du profil</h5>
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm- center gap-4">
                       
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                        <form id="formAccountSettings">
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label for="firstName" class="form-label">Nom Fournisseur</label>

                                    <input class="form-control" type="text" id="txtNomcomplet" name="Nom" placeholder="entrez votre Nom complet" runat="server" />

                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="email" class="form-label">E-mail</label>
                                    <input class="form-control" type="text" id="txtEmail" name="email" placeholder="Entrez votre email" runat="server" />                                                                                         
                                </div>
                        
                                 <div class="mb-3 col-md-6">
                                    <label for="Mot" class="form-label">Mot de passe</label>
                                    <input type="text" class="form-control" id="txtMdp" name="Mot" runat="server" />
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="email" class="form-label">Telephone</label>
                                    <input type="text" class="form-control" id="txttel" name="email" placeholder="Entrez telephone du fournisseur" runat="server" />
                                </div>
                                
                                <div class="mb-3 col-md-6">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="txtadresse" name="address" placeholder="Entrez votre adresse" runat="server" />
                                </div>
                               

                                <div class="mb-3 col-md-6">
                                    <label for="address" class="form-label">type service</label>
                                    <select name="type_service" id="type_service" class="select2 form-select" runat="server">
                                        <option value="restaurant">Restaurant 🍴</option>
                                        <option value="hotel">Hôtel 🏨</option>
                                        <option value="spa">Spa</option> 

                                    </select>
                                </div>
                               
                               
                               
                            <div class="mt-2">
                                <label runat="server" id="ErrMsg" class="text-danger"></label>
                                <asp:Button ID="ajouter" class="btn btn-primary me-2" runat="server" Text="Sauvegarder"  OnClick="Button1_Click" />
                           
                            </div>
                        </form>
                    </div>
                    <!-- /Account -->
                  </div>
                 
                </div>
              </div>
            </div>
               </div>
            <!-- / Content -->

   <h1 style="color: #5D54A4; text-align: center; font-family: 'Medula One', cursive;">Liste complète des fournisseurs</h1> 
    <asp:GridView ID="FournisseurA" runat="server"  AutoGenerateSelectButton="True" OnSelectedIndexChanged="FournisseurA_SelectedIndexChanged"  style="margin:auto;">
       <HeaderStyle BackColor="#ecabb5" />
    </asp:GridView>
    

<br /><br /><br />
       
</asp:Content>
