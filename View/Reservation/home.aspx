<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="StayEsay.View.Reservation.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
      <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />

    <style>
        .accomodation_item {
            margin-bottom: 30px;
        }

            .accomodation_item .hotel_img {
                position: relative;
                margin-bottom: 10px;
                overflow: hidden;
                border-radius: 10px;
            }

                .accomodation_item .hotel_img img {
                    -webkit-transition: all 0.4s linear;
                    -o-transition: all 0.4s linear;
                    transition: all 0.4s linear;
                }

                .accomodation_item .hotel_img .theme_btn {
                    position: absolute;
                    bottom: 20px;
                    left: 50%;
                    -webkit-transform: translate(-50%);
                    -ms-transform: translate(-50%);
                    transform: translate(-50%);
                    padding: 5px 25px;
                    max-width: 128px;
                }

                .accomodation_item .hotel_img:hover img {
                    -webkit-transform: scale(1.19);
                    -ms-transform: scale(1.19);
                    transform: scale(1.19);
                }

            .accomodation_item h5 {
                font-size: 24px;
                line-height: 28px;
                color: #52c5fd;
                font-weight: 600;
                margin-bottom: 0px;
            }

                .accomodation_item h5 small {
                    font-weight: 300;
                    font-size: 14px;
                }

        .sec_h4 {
            font-size: 18px;
            line-height: 38px;
            font-weight: 600;
            color: #222222;
            margin-bottom: 0px;
        }

        .accomodation_two {
            margin-bottom: -40px;
        }

            .accomodation_two .accomodation_item {
                margin-bottom: 45px;
            }

        /*service block*/
        .service-image {
            border: 2px solid #ddd;
            border-radius: 50%;
            display: inline-block;
            padding: 35px;
            background: #ddd;
        }

        .service-details h4 {
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            margin-top: 55px;
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
     <section class="accomodation_area section_gap">
        <div class="container">
            <div class="section_title text-center">
                <h1 class="title_color" style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Hôtels de rêve</h1>
               
            </div>
            <br />
            <div class="row mb_30">
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/Medium-ZafiroPalaceHotel_General Views_0621_Sel33_ret.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/reception.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/Hotel-2978-20230102-094217.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/abou-sofiane-1007043058-original.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="service-block">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-6 width-50">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/wifi.png">
                        </div>
                        <h4><a>free wifi</a></h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 width-50">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/key.png">
                        </div>
                        <h4><a>service de chambre</a></h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/car.png">
                        </div>
                        <h4><a>parking gratuit</a></h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/user.png">
                        </div>
                        <h4><a>service client</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    <section class="accomodation_area section_gap">
        <div class="container">
            <div class="section_title text-center">
                <h2 class="title_color" style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Restaurants gastronomiques</h2>
                <%--<p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, </p>--%>
            </div>
            <br />
            <div class="row mb_30">
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/restaurant.jpg" alt="" style="height: 270px"/>
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/sushi-muraguchi.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/Dar_El_Marsa_9.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <img src="../../Asset/images/restaurant/restaurant1.jpg" alt="" style="height: 270px">
                            <a href="#" class="btn theme_btn button_hover"></a>
                        </div>
                        <a href="#">
                            <h4 class="sec_h4"></h4>
                        </a>
                        <h5><small></small></h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="service-block">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-6 width-50">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/wifi.png">
                        </div>
                        <h4><a>Wi-Fi gratuit</a></h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 width-50">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/table-a-dinner.png" style="width: 50px">
                        </div>
                        <h4><a>Service à table</a></h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/cocktail.png" style="width: 50px">
                        </div>
                        <h4><a>Bar à cocktails</a></h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="../../Asset/images/gallery/user.png">
                        </div>
                        <h4><a>service client</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
