<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="ImagesServices.aspx.cs" Inherits="StayEsay.View.Fournisseur.ImagesServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Asset/vendor/js/jquery-3.2.1.min.js"></script>

    <script src="../../Asset/js/images.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            font-size: 36px;
            margin-top: 0;
        }

        h4 {
            font-size: 18px;
            margin-bottom: 30px;
            color: #fb5bff;
        }

        form {
            margin-bottom: 30px;
        }

        input[type="file"] {
            display: block;
            margin-bottom: 10px;
        }

        Button1 {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-bottom: 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #3e8e41;
        }

        .error-message {
            color: red;
            margin-bottom: 10px;
        }

        .success-message {
            color: green;
            margin-bottom: 10px;
        }

        .center {
            margin: auto;
            width: 50%;
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body>
        <div class="container">
            <h4>Choisir des images de service</h4>
            <%--            <h4>How to Preview and Upload Multiple Images in Asp.Net with Jquery</h4>--%>
            <hr />

            <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="Upload and Save" OnClick="Button1_Click" />

            <asp:Label ID="Label" runat="server" CssClass="success-message" Text=""></asp:Label>
            <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message" Text=""></asp:Label>

        </div>
        <div class="center">
            <asp:GridView ID="ImageGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="imgName" HeaderText="Image Name" ControlStyle-Height="50px" />
                    <asp:ImageField DataImageUrlField="imgPath" HeaderText="Path" />
                </Columns>
            </asp:GridView>
        </div>

    </body>
</asp:Content>
