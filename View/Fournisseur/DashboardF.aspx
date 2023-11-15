<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="DashboardF.aspx.cs" Inherits="StayEsay.View.Fournisseur.DashboardF" %>
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
  cursor: pointer; /* Ajout de la propriété cursor avec la valeur pointer */
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
        <asp:Repeater ID="restaurantReservationRepeater" runat="server">
            <ItemTemplate>
                <div class="card">
                    <div>
                        <div class="numbers">
                            <span><%# Eval("ReservationCount") %></span>
                        </div>
                        <div class="cardName">
                            <span><%# Eval("nom") %></span>
                        </div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="eye-outline"></ion-icon>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>


      <div class="card">
        <div>
          <div class="numbers" style="color:#0094ff">
    <asp:Label ID="CommenatiresLabel" runat="server" Text=""></asp:Label>
</div>

            <div class="cardName" style="color:#0094ff">Commentaires </div>
        </div>
        <div class="iconBx">
            <ion-icon name="eye-outline"></ion-icon>
        </div>
    </div>


    </div>

     

</asp:Content>
