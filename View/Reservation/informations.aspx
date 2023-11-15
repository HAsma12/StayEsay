<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="informations.aspx.cs" Inherits="StayEsay.View.Reservation.informations" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <br /><br /><br /> <br /><br />
     <h5 style="color: #5D54A4; text-align: center; font-family: 'Medula One', cursive;">VOS INFORMATIONS PERSONNELLES
</h5> 
    <br />
     <!-- Content wrapper -->
<div class="content-wrapper">
  <!-- Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
<div class="row justify-content-center">
      <div class="col-md-4">
        <div class="card mb-4">
          <!-- Account -->
          <div class="card-body">
            <div class="d-flex align-items-start align-items-sm-center gap-4"></div>
          </div>
          <hr class="my-0" />
          <div class="card-body">
            <form id="formAccountSettings">
              <div class="row">
                <div class="mb-3 col-md-6">
                  <label for="firstName" class="form-label">Nom utilisateur</label>
                  <input class="form-control" type="text" id="txtNomcomplet" name="Nom" placeholder="Entrez votre Nom complet" runat="server" />
                </div>
              </div>
              <div class="row">
                <div class="mb-3 col-md-6">
                  <label for="email" class="form-label">E-mail</label>
                  <input class="form-control" type="text" id="txtEmail" name="email" placeholder="Entrez votre email" runat="server" />
                </div>
              </div>
              <div class="row">
                <div class="mb-3 col-md-6">
                  <label for="Mot" class="form-label">Mot de passe</label>
                  <input type="text" class="form-control" id="txtMdp" name="Mot" runat="server" />
                </div>
              </div>
              <div class="row">
                <div class="mb-3 col-md-6">
                  <label for="email" class="form-label">Telephone</label>
                  <input type="text" class="form-control" id="txttel" name="email" placeholder="Entrez telephone " runat="server" />
                </div>
              </div>
              <div class="row">
                <div class="mb-3 col-md-6">
                  <label for="address" class="form-label">Address</label>
                  <input type="text" class="form-control" id="txtadresse" name="address" placeholder="Entrez votre adresse" runat="server" />
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-md-6">
                  <label runat="server" id="ErrMsg" class="text-danger"></label>
                    <asp:Button ID="modifier" class="btn btn-primary me-2" runat="server" Text="modifier"  OnClick="edit_Click" />

                </div>
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


      
    <asp:GridView ID="utilisateur" runat="server"   style="margin:auto;" AutoGenerateSelectButton="True" OnSelectedIndexChanged="utilisateur_SelectedIndexChanged">
    </asp:GridView>
    
</asp:Content>
