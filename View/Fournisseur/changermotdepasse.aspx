﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="changermotdepasse.aspx.cs" Inherits="StayEsay.View.Fournisseur.changermotdepasse" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet"/>
     <!-- Page -->
    <link rel="stylesheet" href="../../Asset/vendor/css/pages/page-auth.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Content -->
    <body>
    <div class="container-xxl" style="text-align:center">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
                             <h6 class="mb-2"  style="color: #fb5bff ; text-align: center ;  "> Changement de mot de passe</h6>

              <!-- Logo -->
                <figure aria-hidden="true">
                    <div class="person-body"></div>
                    <div class="neck skin"></div>
                    <div class="head skin">
                        <div class="eyes"></div>
                        <div class="mouth"></div>
                    </div>
                    <div class="hair"></div>
                    <div class="ears"></div>
                    <div class="shirt-1"></div>
                    <div class="shirt-2"></div>
                </figure>
                <style>
                    /** PERSON */
                    figure {
                        --skinH: 30;
                        --skinS: 100%;
                        --skinL: 87%;
                        --hair: rgb(180,70,60);
                        background: hsl(var(--fgColorH), calc(var(--fgColorS) * 2), 95%);
                        border: 1px solid rgba(0,0,0,0.0625);
                        border-radius: 50%;
                        height: 0;
                        margin: auto auto;
                        margin-bottom: 2rem;
                        order: 1;
                        padding-top: 60%;
                        position: relative;
                        width: 60%;
                        overflow: hidden;
                    }

                        figure div {
                            position: absolute;
                            transform: translate(-50%, -50%);
                        }

                        figure .skin {
                            background: hsl(var(--skinH), var(--skinS), var(--skinL));
                            box-shadow: inset 0 0 3rem hsl(var(--skinH), var(--skinS), calc(var(--skinL) * 0.95));
                        }

                        figure .head {
                            top: 40%;
                            left: 50%;
                            width: 60%;
                            height: 60%;
                            border-radius: 100%;
                            box-shadow: 0 -0.175rem 0 0.125rem var(--hair);
                        }

                        figure .ears {
                            top: 47%;
                            left: 50%;
                            white-space: nowrap;
                        }

                            figure .ears::before,
                            figure .ears::after {
                                content: "";
                                background: hsl(var(--skinH), var(--skinS), var(--skinL));
                                border-radius: 50%;
                                width: 1rem;
                                height: 1rem;
                                display: inline-block;
                                margin: 0 2.1rem;
                            }

                        figure .head .eyes {
                            top: 55%;
                            left: 50%;
                            white-space: nowrap;
                        }

                    @-webkit-keyframes blink {
                        0%, 90%, 100% {
                            height: 10px;
                        }

                        95% {
                            height: 0;
                        }
                    }

                    @keyframes blink {
                        0%, 90%, 100% {
                            height: 10px;
                        }

                        95% {
                            height: 0px;
                        }
                    }

                    figure .head .eyes::before,
                    figure .head .eyes::after {
                        content: "";
                        background: var(--borderDarker);
                        border-radius: 50%;
                        width: 10px;
                        height: 10px;
                        display: inline-block;
                        margin: 0 0.5rem;
                        -webkit-animation: blink 5s infinite;
                        animation: blink 5s infinite;
                        transition: all 0.15s;
                    }

                    input[name="show-password"]:checked ~ figure .head .eyes::before,
                    input[name="show-password"]:checked ~ figure .head .eyes::after {
                        height: 0.125rem;
                        animation: none;
                    }

                    figure .head .mouth {
                        border: 0.125rem solid transparent;
                        border-bottom: 0.125rem solid var(--borderDarker);
                        width: 25%;
                        border-radius: 50%;
                        transition: all 0.5s;
                    }

                    form:invalid figure .head .mouth {
                        top: 75%;
                        left: 50%;
                        height: 10%;
                    }

                    form:valid figure .head .mouth {
                        top: 60%;
                        left: 50%;
                        width: 40%;
                        height: 40%;
                    }

                    figure .hair {
                        top: 40%;
                        left: 50%;
                        width: 66.66%;
                        height: 66.66%;
                        border-radius: 100%;
                        overflow: hidden;
                    }

                        figure .hair::before {
                            content: "";
                            display: block;
                            position: absolute;
                            width: 100%;
                            height: 100%;
                            background: var(--hair);
                            border-radius: 50%;
                            top: -60%;
                            left: -50%;
                            box-shadow: 4rem 0 var(--hair);
                        }

                    figure .neck {
                        width: 10%;
                        height: 40%;
                        top: 62%;
                        left: 50%;
                        background: hsl(var(--skinH), var(--skinS), calc(var(--skinL) * 0.94));
                        border-radius: 0 0 2rem 2rem;
                        box-shadow: 0 0.25rem var(--border);
                    }

                    figure .person-body {
                        width: 60%;
                        height: 100%;
                        border-radius: 50%;
                        background: red;
                        left: 50%;
                        top: 126%;
                        background: hsl(var(--fgColorH), var(--fgColorS), var(--fgColorL));
                    }

                    figure .shirt-1,
                    figure .shirt-2 {
                        width: 12%;
                        height: 7%;
                        background: hsl(var(--bgColorH), var(--bgColorS), var(--bgColorL));
                        top: 76%;
                        left: 36.5%;
                        transform: skew(-10deg) rotate(15deg);
                    }

                    figure .shirt-2 {
                        left: 52.5%;
                        transform: skew(10deg) rotate(-15deg);
                    }
                </style>
                
              <!-- /Logo -->
             
             
                <form>
                    <style>
                        form {
                            --background: white;
                            --border: rgba(0, 0, 0, 0.125);
                            --borderDark: rgba(0, 0, 0, 0.25);
                            --borderDarker: rgba(0, 0, 0, 0.5);
                            --bgColorH: 0;
                            --bgColorS: 0%;
                            --bgColorL: 98%;
                            --fgColorH: 210;
                            --fgColorS: 50%;
                            --fgColorL: 38%;
                            --shadeDark: 0.3;
                            --shadeLight: 0.7;
                            --shadeNormal: 0.5;
                            --borderRadius: 0.125rem;
                            --highlight: #306090;
                        }

                       
                    </style>
                  
                    <div class="mb-3">
                        <label for="email" class="form-label">l'adresse e-mail </label>
                        <input type="text" class="form-control" id="txtEmail" name="email" placeholder="Enter votre email" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="Mot" class="form-label">mot de passe actuel</label>
                        <input class="form-control" type="password" id="txtMdp" placeholder="Mot de passe" runat="server"
                       />
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">nouveau mot de passe</label>
                        <input class="form-control" type="password" id="txtNewPassword" placeholder="Mot de passe" runat="server"
                            /> 

                    </div>
                    <div class="mb-3">
                        <label for="adresse" class="form-label"> confirmation du nouveau mot de passe</label>
                        <input class="form-control" type="password" id="txtConfirmNewPassword" placeholder="Mot de passe" runat="server"
                            />                    

                    </div>

                    <label runat="server" id="ErrMsg" class="text-danger"></label>
                    <br />
                    <asp:Button ID="EditBtn" runat="server" Text="Modifier" class="btn btn-secondary" OnClick="EditBtn_Click" style="background-color:#fb5bff " />

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
      
</body>
    <!-- / Content -->
</asp:Content>
