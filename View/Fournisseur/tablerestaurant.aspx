<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="tablerestaurant.aspx.cs" Inherits="StayEsay.View.Fournisseur.tablerestaurant" %>
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
                    <h2 class="title" style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Soumettre une nouvelle table</h2>
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <input class="input--style-1" type="text" placeholder="Numéro de table" id="txtNumerotable" runat="server" />
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <input class="input--style-1" type="text" placeholder="Capacité" id="txtCapacite" runat="server" />
                            </div>
                        </div>
                        <div class="col-2">
                            <label for="free">Emplacement</label>
                            <div class="form-check" id="ddlEmplacement">
                                <input class="form-check-input" type="radio" name="emplacement" id="Radio3" groupname="free" value="yes" runat="server" />
                                <label class="form-check-label">Zone intérieure</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="emplacement" id="Radio4" groupname="free" value="no" runat="server" />
                                <label class="form-check-label">Terrasse</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="emplacement" id="Radio5" groupname="free" value="no" runat="server" />
                                <label class="form-check-label" for="free-no">Balcon</label>
                            </div>
                        </div>

                        <div class="col-2">
                            <label for="free">Free</label>
                            <div class="form-check" id="etat">
                                <input class="form-check-input" type="radio" name="etat" id="Radio1" groupname="free" value="yes" runat="server" />
                                <label class="form-check-label" for="free-yes">Libre</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="etat" id="Radio2" groupname="free" value="no" runat="server" />
                                <label class="form-check-label" for="free-no">Réservée</label>
                            </div>
                        </div>
                       
                  <div class="col-2">
                            <label for="date">Date</label>
                            <input type="date" class="form-control" id="txtdate"  runat="server" />
                        </div>

                        <div class="col-2">
                            <label for="plage-horaire-debut">Plage horaire de début</label>
                            <input type="time" class="form-control" id="heureDebut" name="plage-horaire-debut" runat="server" />
                        </div>
                        <div class="col-2">
                            <label for="plage-horaire-fin">Plage horaire de fin</label>
                            <input type="time" class="form-control" id="heureFin" name="plage-horaire-fin" runat="server" />
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <input class="input--style-1" type="text" placeholder="Description" id="txtDescription" runat="server" />
                            </div>
                        </div>
                        <div class="col-2">
                            <label for="ddlRestaurant">Restaurant</label>
                            <asp:DropDownList ID="ddlRestaurant" runat="server" CssClass="input--style-1"></asp:DropDownList>
                        </div>

                    </div>
                    <label runat="server" id="ErrMsg" class="text-info"></label>
                    <div class="p-t-20">
                        <asp:Button ID="AddBtn" class="btn btn--radius btn--green" runat="server" Text="Ajouter" OnClick="AddBtn_Click" Style="width: 100px; background: #ecabb5;" />
                        <asp:Button ID="EditBtn" runat="server" class="btn btn--radius btn--green" Text="Modifier" OnClick="EditBtn_Click" Style="width: 100px; background: #6b84b1;" />
                        <asp:Button ID="Delete" runat="server" Text="Supprimer" class="btn btn-danger" OnClick="Delete_Click" Style="width: 100px;" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br />
    <h1 style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Liste complète des tables </h1>
    <br />
<%--    <asp:GridView runat="server" class="table table-hover" ID="Table" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Table_SelectedIndexChanged"></asp:GridView>--%>



       <asp:GridView runat="server"  AutoGenerateColumns="False" class="table table-hover" ID="Table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Table_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Idtable" HeaderText="Idtable" />
        <asp:BoundField DataField="Numerotable" HeaderText="Numerotable" />
         <asp:BoundField DataField="Capacité" HeaderText="Capacité" />
             
         <asp:BoundField DataField="Emplacement" HeaderText="Emplacement" />
       <asp:BoundField DataField="etat" HeaderText="etat" />
           <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:BoundField DataField="heuredebut" HeaderText="heuredebut" />
            <asp:BoundField DataField="heurefin" HeaderText="heurefin" />
    </Columns>
</asp:GridView>


    <!-- Jquery JS-->
    <script src="../../Asset/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="../../Asset/vendor/select2/select2.min.js"></script>
    <!-- Main JS-->
    <script src="../../Asset/js/global.js"></script>
</asp:Content>
