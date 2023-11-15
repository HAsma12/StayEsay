<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="Chambres.aspx.cs" Inherits="StayEsay.View.Fournisseur.Chambres" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Icons font CSS-->
    <link href="../../Asset/vendor/select2/material-design-iconic-font.min.css" rel="stylesheet" media="all" />
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />

    <!-- Vendor CSS-->
    <link href="../../Asset/vendor/select2/select2.min.css" rel="stylesheet" media="all" />


    <!-- Main CSS-->
    <link href="../../Asset/css/main.css" rel="stylesheet" media="all" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <style type="text/css">
        .center {
            margin: auto;
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    
                    
                    <h2 class="title" style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Soumettre une nouvelle chambre</h2>
                     <div class="row row-space">
                     <div class="col-2">
                            <div class="input-group">
                                <input class="input--style-1" type="text" placeholder="Numéro de chambre " id="txtChNum" runat="server" />
                            </div>
                          </div>
                     <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select id="txttype" runat="server">
                                       
                                        <option>Family</option>
                                        <option>Single</option>
                                        <option>Double</option>

                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>

                           <div class="col-2">
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select id="txtvue" runat="server">
                                      
                                        <option>mer</option>
                                        <option>ville</option>
                                        <option>Montagne</option>

                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                      
                   

                   
                            <div class="col-2">
                                <div class="input-group">
                                    <label for="prix">Prix par nuitée:</label>
                                    <input type="text" name="prix" id="txtPrix" runat="server" required />
                                </div>
                            
                                 <div class="col-2">
                            <label for="ddlhotel">hotel</label>
                            <asp:DropDownList ID="ddlhotel" runat="server" CssClass="input--style-1"></asp:DropDownList>
                        </div>
                            </div>
    </div>
    </div>
                    <label runat="server" id="ErrMsg" class="text-info"></label>
                    <div class="p-t-20">
                        <asp:Button ID="AddBtn" class="btn btn--radius btn--green" runat="server" Text="Ajouter" OnClick="AddBtn_Click" Style="width: 100px; background: #ecabb5;" />
                        <asp:Button ID="EditBtn" runat="server" class="btn btn--radius btn--green" Text="Modifier"   OnClick="EditBtn_Click"  Style="width: 100px;  background: #6b84b1;" />
                       <asp:Button ID="Delete" runat="server" class="btn btn--radius btn--green" Text="Supprimer"   OnClick="Delete_Click"  Style="width: 100px;  background: #ff0000;" />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="center">
        <div class="row">
            <div class="col">
                <h1 style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Liste complète des chambres</h1>
            
                <br />
                <br />

                <asp:GridView runat="server" class="table table-hover" ID="ChambresGrid" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="ChambresGrid_SelectedIndexChanged">
                    <Columns>
                         <asp:BoundField DataField="IdCH" HeaderText="IdCH" />
                        <asp:BoundField DataField="nombrechambre" HeaderText="nombre chambres" />
                        <asp:BoundField DataField="type" HeaderText="type" />
                         <asp:BoundField DataField="vue" HeaderText="vue" />
                         <asp:BoundField DataField="prix" HeaderText="prix" />

                        
                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>



    <!-- Jquery JS-->
    <script src="../../Asset/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="../../Asset/vendor/select2/select2.min.js"></script>


    <!-- Main JS-->
    <script src="../../Asset/js/global.js"></script>



</asp:Content>
