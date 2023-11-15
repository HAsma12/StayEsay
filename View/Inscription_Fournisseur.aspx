<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscription_Fournisseur.aspx.cs" Inherits="StayEsay.View.Inscription_Fournisseur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0" />
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../Asset/css/inscription.css" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;800&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Courgette&family=Pacifico&display=swap" rel="stylesheet" />

</head>
<body>
    <div class="main">
        <form class="form" runat="server">

            <div class="container b-container" id="b-container">
                <div class="form" id="b-form">

                    <h4 class="form_title title" style="font-family: 'Courgette', cursive; font-family: 'Pacifico', cursive; font-size: 20px;">Inscrivez-vous en tant que fournisseur</h4>
                    <input class="form__input" type="text" id="fournisseur_txtNomcomplet" placeholder="Nom Complet" runat="server" clientidmode="Static" required />
                    <input class="form__input" type="Email" id="fournisseur_txtEmail" placeholder="Email" runat="server" clientidmode="Static" required />
                    <input class="form__input" type="password" id="fournisseur_txtMdp" placeholder="Mot de passe" runat="server"
                       />


                    <input class="form__input" type="text" id="fournisseur_txtTel" placeholder="Telephone" runat="server" pattern="^[2,3,5,7,9]\d{7}$" required />

                    <input class="form__input" type="text" id="fournisseur_txtAdresse" placeholder="Adresse" runat="server">

                    <label for="type_service">Type de service proposé :</label>
                    <select name="type_service" id="type_service" style="width: 350px; height: 60px" runat="server" class="form__input" clientidmode="Static" required>
                        <option value="restaurant">Restaurant </option>
                        <option value="hotel">Hôtel </option>                 
                    </select>
                    <br />

                    <label runat="server" id="Label1" style="color: #00BFBF; font-size: 13px"></label>

                    <asp:Button ID="btnDevenirFournisseur" runat="server" Text="s'inscrire" OnClick="btnDevenirFournisseur_Click" Style="height: 50px; width: 180px; border-radius: 25px; margin-top: 50px; font-size: 14px; background-color: #4B70E2; color: #f9f9f9;" />

                </div>


            </div>
        </form>



        <div class="switch" id="switch-cnt">
            <div class="switch__circle"></div>
            <div class="switch__circle switch__circle--t"></div>
            <div class="switch__container" id="switch-c1">
                <h2 class="switch__title title" style="font-size: 24px; font-family: 'Courgette', cursive; font-family: 'Pacifico', cursive;">Bienvenue parmi nous !</h2>
                <p class="switch__description description">Commencez à proposer vos services de réservation en ligne en prévoyant votre compte</p>
                <a href="Inscription.aspx" style="font-family: 'Medula One', cursive ; color:#fb5bff">Inscription utilisateur</a>

            </div>


            <div class="switch__container is-hidden" id="switch-c2">
                <h2 class="switch__title title" style="font-size: 20px; font-family: 'Courgette', cursive; font-family: 'Pacifico', cursive;">Bienvenue parmi nous !</h2>
                <p class="switch__description description">Commencez à proposer vos services de réservation en ligne en prévoyant votre compte</p>
                <button class="switch__button button switch-btn">Devenir utilisateur</button>
            </div>
        </div>

        <div />
        <%--   <script>
        /*
		Designed by: SELECTO
		Original image: https://dribbble.com/shots/5311359-Diprella-Login
*/

     

        let switchCtn = document.querySelector("#switch-cnt");
        let switchC1 = document.querySelector("#switch-c1");
        let switchC2 = document.querySelector("#switch-c2");
        let switchCircle = document.querySelectorAll(".switch__circle");
        let switchBtn = document.querySelectorAll(".switch-btn");
        let aContainer = document.querySelector("#a-container");
        let bContainer = document.querySelector("#b-container");
        let allButtons = document.querySelectorAll(".submit");

        let getButtons = (e) => e.preventDefault()

        let changeForm = (e) => {

            switchCtn.classList.add("is-gx");
        setTimeout(function(){
            switchCtn.classList.remove("is-gx");
        }, 1500)

        switchCtn.classList.toggle("is-txr");
        switchCircle[0].classList.toggle("is-txr");
        switchCircle[1].classList.toggle("is-txr");

        switchC1.classList.toggle("is-hidden");
        switchC2.classList.toggle("is-hidden");
        aContainer.classList.toggle("is-txl");
        bContainer.classList.toggle("is-txl");
        bContainer.classList.toggle("is-z200");
        }

        let mainF = (e) => {
            for (var i = 0; i < allButtons.length; i++)
        allButtons[i].addEventListener("click", getButtons );
        for (var i = 0; i < switchBtn.length; i++)
            switchBtn[i].addEventListener("click", changeForm)
        }

        window.addEventListener("load", mainF);

    </script>--%>
</body>
</html>
