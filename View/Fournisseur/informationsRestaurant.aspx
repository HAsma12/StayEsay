<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="informationsRestaurant.aspx.cs" Inherits="StayEsay.View.Fournisseur.informationsRestaurant" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="stylesheet" href="../../Asset/vendor/css/pages/page-auth.css" />

    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-xxl" style="text-align: center">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner">
            
                <div class="card">
                    <div class="card-body">
                      
                        <h2 class="mb-2" style="color: #ecabb5; font-family: 'Medula One', cursive;">Ajouter un restaurant </h2>

                        <div class="app-brand justify-content-center">
                            <a href="#" class="app-brand-link gap-2">
                                <img src="../../Asset/images/icons/ouvert.png" style="width: 150px" />
                            </a>
                        </div>
              

                        <form>

                            <div class="mb-3">
                                <label for="adresse" class="form-label">Nom de restaurant  :</label>
                                <input type="text" class="form-control" id="txtnomrestaurant" name="nom" placeholder="Entrez Nom de restaurant " runat="server" />

                            </div>
                            <div class="mb-3">
                                <label for="description">Description :</label>
                                <textarea id="txtdescription" name="description" required runat="server" /></textarea><br>
                            </div>

                            <div class="mb-3">
                                <label for="adresse" class="form-label">CUISINES  :</label>
                                <input type="text" class="form-control" id="txtcuisine" name="nom" placeholder=" " runat="server" />
                            </div>

                            <div class="mb-3">
                                <label for="adresse" class="form-label">REPAS:</label>
                                <input type="text" class="form-control" id="txtrepas" name="nom" placeholder=" " runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="adresse" class="form-label">RÉGIMES SPÉCIAUX:</label>
                                <input type="text" class="form-control" id="txtregimes" name="nom" placeholder=" " runat="server" />
                            </div>
                            <br />

                            <div class="mb-3">
                                <label for="image-hotel" class="form-label">Image pour le restaurant :</label>
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
                                <label for="image-hotel" class="form-label">Menu :</label>
                                <asp:FileUpload ID="FileUpload4" runat="server" class="form-control" />

                            </div>


                            <div class="mb-3">
                                <label for="adresse" class="form-label">Adresse:</label>
                                <input type="text" class="form-control" id="txtAdresse" name="email" placeholder="Entrez adresse de l'hôtel  " runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="txtTel" name="email" placeholder="Entrez Numero telephone " runat="server" />
                            </div>

                            <label runat="server" id="ErrMsg" style="color:#ecabb5"></label>
                            <br /><br />
                            <asp:Button ID="AddBtn" class="btn btn--radius btn--green" runat="server" Text="Ajouter" OnClick="AddBtn_Click" Style="width: 100px; background: #ecabb5;" />
                        <%-- <asp:Button ID="delete" class="btn btn--radius btn--green" runat="server" Text="delete" OnClick="deleteBtn_Click" Style="width: 100px; background: #ecabb5;" />--%>

                        </form>
                        <p class="text-center">
                            <span></span>
                            <a href="#">
                                <span></span>
                            </a>
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </div>
        <h1 style="color: #5D54A4; text-align: center; font-family: 'Medula One', cursive;"></h1>
    <asp:GridView runat="server" class="table table-hover" OnRowDataBound="Restaurant_RowDataBound" ID="Restaurant" AutoGenerateSelectButton="True" OnSelectedIndexChanged="restaurant_SelectedIndexChanged">

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
             <asp:TemplateField HeaderText="menu">
                <ItemTemplate>
                    <asp:Image ID="menu" runat="server" Height="50px" Width="50px" />
                </ItemTemplate>
            </asp:TemplateField>
    
        </Columns>
    </asp:GridView>
</asp:Content>
