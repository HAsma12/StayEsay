<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CodeActivation.aspx.cs" Inherits="StayEsay.View.CodeActivation" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />
    <title></title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html, body {
        height: 100%;
        background-color: #bccbf7;
        font-family: "Roboto Slab", serif;
        color: white;
    }

    .preload * {
        transition: none !important;
    }

    label {
        display: block;
        font-weight: bold;
        font-size: small;
        text-transform: uppercase;
        font-size: 0.7em;
        margin-bottom: 0.35em;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        border: none;
        padding: 0.5em;
        border-radius: 2px;
        margin-bottom: 0.5em;
        color: #333;
    }

        input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
            box-shadow: inset -1px -1px 3px rgba(0, 0, 0, 0.3);
        }

    /*button {
        padding-left: 1.5em;
        padding-right: 1.5em;
        padding-bottom: 0.5em;
        padding-top: 0.5em;
        border: none;
        border-radius: 2px;
        background-color: #bccbf7;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
        color: white;
        box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.45);
    }*/

    small {
        font-size: 1.5em;
        font-family: 'Medula One', cursive;
    }

    .login--login-submit {
        float: right;
    }

    .login--container {
        width: 600px;
        background-color: #bccbf7;
        margin: 0 auto;
        position: relative;
        top: 25%;
    }

    .login--toggle-container {
        position: absolute;
        background-color: #bccbf7;
        right: 0;
        line-height: 2.5em;
        width: 50%;
        height: 120px;
        text-align: right;
        cursor: pointer;
        transform: perspective(1000px) translateZ(1px);
        transform-origin: 0% 0%;
        transition: all 1s cubic-bezier(0.06, 0.63, 0, 1);
        backface-visibility: hidden;
    }

        .login--toggle-container .js-toggle-login {
            font-size: 2em;
            text-decoration: underline;
            font-family: 'Medula One', cursive;
        }

    .login--active .login--toggle-container {
        transform: perspective(1000px) rotateY(180deg);
        background-color: #bccbf7;
    }

    .login--username-container, .login--password-container {
        float: left;
        background-color: #bccbf7;
        width: 50%;
        height: 120px;
        padding: 0.5em;
    }

    .login--username-container {
        transform-origin: 100% 0%;
        transform: perspective(1000px) rotateY(180deg);
        transition: all 1s cubic-bezier(0.06, 0.63, 0, 1);
        background-color: #bccbf7;
        backface-visibility: hidden;
    }

    .login--active .login--username-container {
        transform: perspective(1000px) rotateY(0deg);
        background-color: #bccbf7;
    }

    footer {
        position: absolute;
        bottom: 12px;
        left: 20px;
    }


    .align {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .js-toggle-login {
    }

    .login--login-submit {
        /* style spécifique pour ce bouton */
        background-color: #f6c6f7;
        border: none; /* suppression de la bordure */
        color: white; /* couleur du texte */
        padding: 12px 24px; /* espace intérieur */
        text-align: center; /* alignement du texte */
        text-decoration: none; /* suppression du soulignement */
        display: inline-block; /* affichage en ligne */
        font-size: 16px; /* taille de police */
        margin: 4px 2px; /* marge extérieure */
        cursor: pointer; /* curseur pointer */
        border-radius: 4px; /* bordure arrondie */
    }
</style>
<body class="align">
    <form runat="server">
        <div class='preload login--container'>
            <div class='login--form'>
                <div class='login--username-container'>

                    <label>Activation Code:</label>
                    <input type="text" id="txtActivationCode" name="activationCode" runat="server" />

                    <label runat="server" id="ErrMsg" class="text-danger"></label>
                    <asp:Button class='js-toggle-login login--login-submit' ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </div>

            </div>

            <div class='login--toggle-container'>
                <small>Bienvenue,</small>
                <div class='js-toggle-login'>Entrez votre code ici</div>
                <small>Pour finaliser votre inscription</small>
            </div>
        </div>
        <footer>
            <a class='twitter-follow-button' data-show-count='false' href='https://twitter.com/code_dependant'>Follow @code_dependant
            </a>
            <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
        </footer>


    </form>
</body>

<script>
    (function() {
        $(function() {
            $(".login--container").removeClass("preload");
            this.timer = window.setTimeout(() => {
                return $(".login--container").toggleClass("login--active");
        }, 2000);
        return $(".js-toggle-login").click(() => {
            window.clearTimeout(this.timer);
        $(".login--container").toggleClass("login--active");
        return $(".login--username-container input").focus();
    });
    });

    }).call(this);

    //# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiPGFub255bW91cz4iXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7RUFBQSxDQUFBLENBQUUsUUFBQSxDQUFBLENBQUE7SUFDQSxDQUFBLENBQUUsbUJBQUYsQ0FBc0IsQ0FBQyxXQUF2QixDQUFtQyxTQUFuQztJQUNBLElBQUMsQ0FBQSxLQUFELEdBQVMsTUFBTSxDQUFDLFVBQVAsQ0FBa0IsQ0FBQSxDQUFBLEdBQUE7YUFDekIsQ0FBQSxDQUFFLG1CQUFGLENBQXNCLENBQUMsV0FBdkIsQ0FBbUMsZUFBbkM7SUFEeUIsQ0FBbEIsRUFFUCxJQUZPO1dBSVQsQ0FBQSxDQUFFLGtCQUFGLENBQXFCLENBQUMsS0FBdEIsQ0FBNEIsQ0FBQSxDQUFBLEdBQUE7TUFDMUIsTUFBTSxDQUFDLFlBQVAsQ0FBb0IsSUFBQyxDQUFBLEtBQXJCO01BQ0EsQ0FBQSxDQUFFLG1CQUFGLENBQXNCLENBQUMsV0FBdkIsQ0FBbUMsZUFBbkM7YUFDQSxDQUFBLENBQUUsa0NBQUYsQ0FBcUMsQ0FBQyxLQUF0QyxDQUFBO0lBSDBCLENBQTVCO0VBTkEsQ0FBRjtBQUFBIiwic291cmNlc0NvbnRlbnQiOlsiJCAtPlxuICAkKFwiLmxvZ2luLS1jb250YWluZXJcIikucmVtb3ZlQ2xhc3MoXCJwcmVsb2FkXCIpXG4gIEB0aW1lciA9IHdpbmRvdy5zZXRUaW1lb3V0ID0+XG4gICAgJChcIi5sb2dpbi0tY29udGFpbmVyXCIpLnRvZ2dsZUNsYXNzKFwibG9naW4tLWFjdGl2ZVwiKVxuICAsIDIwMDBcblxuICAkKFwiLmpzLXRvZ2dsZS1sb2dpblwiKS5jbGljayA9PlxuICAgIHdpbmRvdy5jbGVhclRpbWVvdXQoQHRpbWVyKVxuICAgICQoXCIubG9naW4tLWNvbnRhaW5lclwiKS50b2dnbGVDbGFzcyhcImxvZ2luLS1hY3RpdmVcIilcbiAgICAkKFwiLmxvZ2luLS11c2VybmFtZS1jb250YWluZXIgaW5wdXRcIikuZm9jdXMoKVxuICAgICJdfQ==
    //# sourceURL=coffeescript</script>

</html>
