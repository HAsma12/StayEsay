<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="Dashbord.aspx.cs" Inherits="StayEsay.View.Administrateur.Dashbord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


   <style>
.cardBox {
  position: relative;
  width: 100%;
  padding: 20px;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 30px;
}

.cardBox .card {
  position: relative;
  background: var(--white);
  padding: 30px;
  border-radius: 20px;
  display: flex;
  justify-content: space-between;
  cursor: pointer;
  box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
  transition: background-color 0.3s ease;
}

.cardBox .card .numbers {
  position: relative;
  font-weight: 500;
  font-size: 2.5rem;
  color: var(--blue);
}

.cardBox .card .cardName {
  color: var(--black2);
  font-size: 1.1rem;
  margin-top: 5px;
}

.cardBox .card .iconBx {
  font-size: 3.5rem;
  color: var(--black2);
}

.cardBox .card:hover {
  background: var(--blue);
  cursor: pointer; 
  background-color:#ecabb5;
}

.cardBox .card:hover .numbers,
.cardBox .card:hover .cardName,
.cardBox .card:hover .iconBx {
  color: var(--white);
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="cardBox">
    <div class="card">
        <div>
          <div class="numbers" style="color:#0094ff">
    <asp:Label ID="userCountLabel" runat="server" Text=""></asp:Label>
</div>

            <div class="cardName" style="color:#0094ff">Comptes utilisateurs</div>
        </div>
        <div class="iconBx">
            <ion-icon name="eye-outline"></ion-icon>
        </div>
    </div>


 <div class="card">
            <div>
                <div class="numbers" style="color:#16c6d1">
                    <asp:Label ID="supplierCountLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="cardName" style="color:#16c6d1">Comptes Fournisseurs</div>

            </div>
            <div class="iconBx">
                <ion-icon name="eye-outline"></ion-icon>
            </div>
        </div>


      <div class="card">
            <div>
                <div class="numbers" style="color:#14f386">
                    <asp:Label ID="HotelLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="cardName"  style="color:#14f386">Hotels</div>
            </div>
            <div class="iconBx">
                <ion-icon name="eye-outline"></ion-icon>
            </div>
        </div>





        <div class="card">
            <div>
                <div class="numbers"  style="color:#ff0000">
                    <asp:Label ID="serviceRestaurantLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="cardName" style="color:#ff0000">Restaurants</div>
            </div>
            <div class="iconBx">
                <ion-icon name="eye-outline"></ion-icon>
            </div>
        </div>


</div>

</asp:Content>
