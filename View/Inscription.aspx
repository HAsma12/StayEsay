<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="StayEsay.View.Inscription" %>
<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../Asset/css/inscription.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Courgette&family=Pacifico&display=swap" rel="stylesheet">
</head>

<body>
    <div class="main">
        <form class="form" runat="server">
            <div class="container a-container" id="a-container">
                <div id="a-form" class="form">
                    <h2 class="form_title title" style="font-family: 'Courgette', cursive; font-family: 'Pacifico', cursive;">Rejoignez-nous</h2>
                    <br />
                    <input class="form__input" type="text" id="txtNomcomplet" placeholder="Nom Complet" runat="server" required>
                    <input class="form__input" type="Email" id="txtEmail" placeholder="Email" runat="server" required>

                    <input class="form__input" type="password" id="txtMdp" placeholder="Mot de passe" runat="server"
                       pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:])([^\s]){8,16}$"
                        title="Le mot de passe doit contenir entre 8 et 16 caractères, au moins une majuscule, une minuscule, un chiffre et un caractère spécial."
                        required />

                    <input class="form__input" type="text" id="txtTel" placeholder="Telephone" runat="server" pattern="^[2,3,5,7,9]\d{7}$" required />
                    <input class="form__input" type="text" id="txtAdresse" placeholder="Adresse" runat="server" required>

                    <label runat="server" id="ErrMsg" style="color: #00BFBF; font-size: 13px"></label>
                    <asp:Button ID="btnDevenirUtilisateur" runat="server" Text="s'inscrire" OnClick="btnDevenirUtilisateur_Click" Style="height: 50px; width: 180px; border-radius: 25px; margin-top: 50px; font-size: 14px; background-color: #4B70E2; color: #f9f9f9;" />


                </div>
            </div>
               <div />
   
               <div />
        </form>
        <div id="loading" style="display: none;">
    Envoi en cours...
</div>


        <div class="switch" id="switch-cnt">
            <div class="switch__circle"></div>
            <div class="switch__circle switch__circle--t"></div>
            <div class="switch__container" id="switch-c1">
                <h2 class="switch__title title" style="font-size: 24px; font-family: 'Courgette', cursive; font-family: 'Pacifico', cursive;">Soyez le bienvenu !</h2>
                <p class="switch__description description">Rejoignez notre communauté de réservation en ligne en fonction de votre compte</p>
                <a href="Inscription_Fournisseur.aspx" style="font-family: 'Medula One', cursive; color:#f33bf7">Inscription fournisseur</a>

            </div>

            <div class="switch__container is-hidden" id="switch-c2">
                <h2 class="switch__title title" style="font-size: 20px; font-family: 'Courgette', cursive; font-family: 'Pacifico', cursive;">Bienvenue parmi nous !</h2>
                <p class="switch__description description">Commencez à proposer vos services de réservation en ligne en prévoyant votre compte</p>

            </div>
        </div>

        <div />

</body>

  


</html>
