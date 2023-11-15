<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="Informations_hotels.aspx.cs" Inherits="StayEsay.View.Fournisseur.Informations_hotels" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Asset/vendor/css/pages/page-auth.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xxl" style="text-align: center">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner">
                <!-- Register Card -->
                <div class="card">
                    <div class="card-body">
                        <!-- Logo -->
                        <div class="app-brand justify-content-center">
                            <a href="#" class="app-brand-link gap-2">
                                <img src="../../Asset/images/icons/hotel (1).gif" style="width: 96px" />
                            </a>
                        </div>
                     


                        <form>

                            <div class="mb-3">
                                <label for="adresse" class="form-label">Nom de l'hôtel :</label>
                                <input type="text" class="form-control" id="txtnomhotel" name="email" placeholder="Entrez Nom de l'hôtel " runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="description">Description :</label>
                                <textarea id="txtdescription" name="description" required runat="server" /></textarea><br>
                            </div>

                            <br />
                            <div class="mb-3">
                                <label for="categorie" class="form-label">Catégorie :</label>
                                <select class="form-select" id="txtcategorie" name="categorie" runat="server" required>
                                    <option value="">Sélectionnez une catégorie</option>
                                    <option value="1">⭐</option>
                                    <option value="2">⭐⭐</option>
                                    <option value="3">⭐⭐⭐</option>
                                    <option value="4">⭐⭐⭐⭐</option>
                                    <option value="5">⭐⭐⭐⭐⭐</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="image-hotel" class="form-label">Image pour l'hôtel :</label>
                                <asp:FileUpload ID="upload1" runat="server" class="form-control" />

                            </div>
                             <div class="mb-3">
                                <label for="image-hotel" class="form-label">Image supplémentaire 1 :</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />

                            </div>
                             <div class="mb-3">
                                <label for="image-hotel" class="form-label">Image supplémentaire 2 :</label>
                                <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" />

                            </div>
                             <div class="mb-3">
                                <label for="image-hotel" class="form-label">Image supplémentaire 3 :</label>
                                <asp:FileUpload ID="FileUpload3" runat="server" class="form-control" />

                            </div>
                          

                            <div class="mb-3">
                                <label for="adresse" class="form-label">Adresse:</label>
                                <input type="text" class="form-control" id="txtAdresse" name="email" placeholder="Entrez adresse de l'hôtel  " runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="txtTel" name="email" placeholder="Entrez Numero telephone " runat="server" />
                            </div>

                            <label runat="server" id="ErrMsg" class="text-danger"></label>

                            <asp:Button ID="AddBtn" class="btn btn--radius btn--green" runat="server" Text="Ajouter" OnClick="AddBtn_Click" Style="width: 100px; background: #ecabb5;" />
                      
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
    <h1 style="color: #5D54A4; text-align: center; font-family: 'Medula One', cursive;"></h1>
    <asp:GridView runat="server" class="table table-hover" OnRowDataBound="GridView1_RowDataBound" ID="GridView1" AutoGenerateSelectButton="True" OnSelectedIndexChanged="hotel_SelectedIndexChanged">

         <Columns>
  <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="imgfournisseur" runat="server" Height="50px" Width="50px" />
                </ItemTemplate>
            </asp:TemplateField>
<asp:TemplateField HeaderText="img1">
                <ItemTemplate>
                    <asp:Image ID="img1" runat="server" Height="50px" Width="50px" />
                </ItemTemplate>
            </asp:TemplateField>
         
<asp:TemplateField HeaderText="img2">
                <ItemTemplate>
                    <asp:Image ID="img2" runat="server" Height="50px" Width="50px" />
                </ItemTemplate>
            </asp:TemplateField>
<asp:TemplateField HeaderText="img3">
                <ItemTemplate>
                    <asp:Image ID="img3" runat="server" Height="50px" Width="50px" />
                </ItemTemplate>
            </asp:TemplateField>
    
        </Columns>
    </asp:GridView>


</asp:Content>
