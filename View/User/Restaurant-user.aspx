<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Restaurant-user.aspx.cs" Inherits="StayEsay.View.User.Restaurant_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <title>Réservation en ligne</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .hero-image {
            background-image: url('https://www.example.com/images/hotel-background.jpg');
            background-color: #cccccc;
            height: 500px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

        .hero-text {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="date"], .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .form-group .form-control::-webkit-inner-spin-button,
        .form-group .form-control::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .form-group select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-arrow-down-512.png');
            background-repeat: no-repeat;
            background-position: right 10px top 50%;
            background-size: 24px;
        }

        .submit-btn {
            background-color: #007bff;
            color: #fff;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
        }

        .submit-btn:hover {
            background-color: #0069d9;
        }
        .image-container {
  position: relative;
  height: 500px; /* ajustez la hauteur selon vos besoins */
  background-image: url('url-de-votre-image.jpg'); /* remplacez "url-de-votre-image.jpg" par l'URL de votre image */
  background-size: cover;
  background-position: center;
}

.form-container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

    </style>

</asp:Content>

  <asp:Content ID="Content3" ContentPlaceHolderID="Mybody" runat="server">
 
<body>
    <div class="hero-image">
        <div class="hero-text">
            <h1>Réservez votre séjour maintenant</h1>
            <p>Offrez-vous un séjour inoubliable dans l'un de nos hôtels partenaires. Réservez dès maintenant pour profiter des meilleurs tarifs et des meilleures offres.</p>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <form>
                            <div class="form-group">
                                <label>Date d'arrivée:</label>
                                <input type="date" class="form-control" name="checkInDate" required />
                            </div>
                            <div class="form-group">
                                <label>Date de départ:</label>
                                <input type="date" class="form-control" name="checkOutDate" required />
                            </div>
                            <div class="form-group">
                                <label>Invités:</label>
                                <select class="form-control" name="guests" required>
                                    <option value="">Sélectionnez le nombre d'invités</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Rechercher</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6 image-container"></div>
                </div>
            </div>
        </div>
    </div>
                
</asp:Content>
