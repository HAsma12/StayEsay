<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StayEsay.View.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Asset/css/login.css" />

</head>
<body>

    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <form class="login" runat="server">
                    <span class="login100-form-title p-b-26"></span>
                    <h1 style="color: #00BFBF; text-align: center; font-family: 'Medula One', cursive;">Accéder à votre compte </h1>
                    <br />
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <input type="text" class="login__input" id="txtEmail" placeholder="Email" runat="server" />
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock"></i>
                        <input type="password" class="login__input" id="txtMdp" placeholder="Mot de passe" runat="server" />
                    </div>
                    <br />
                    <br />
                    <a href="Inscription.aspx" style="font-family: 'Medula One', cursive; color: #5D54A4; text-align: center; justify-content: center">s'inscrire</a>

                    <label id="InfoMsg" runat="server" class="text-danger"></label>
                    <asp:Button runat="server" CssClass="button login__submit" Text="Accéder" Style="font-family: 'Medula One', cursive; color: #00BFBF; font-size: 25px" OnClick="Button1_Click" />

                    <br />
                    <br />
                </form>


            </div>
            <div class="screen__background">
                <span class="screen__background__shape screen__background__shape4"></span>
                <span class="screen__background__shape screen__background__shape3"></span>
                <span class="screen__background__shape screen__background__shape2"></span>
                <span class="screen__background__shape screen__background__shape1"></span>
            </div>
        </div>
    </div>
</body>
</html>
