<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="hotelreservation.aspx.cs" Inherits="StayEsay.View.Reservation.hotelreservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      .ligne {
        display: flex;
        align-items: center;
      }

      .cadre {
        border: 2px solid black;
        padding: 20px;
      }

      .champ {
        margin-right: 10px;
      }

      .chambreOccupation {
        position: relative;
      }

      #afficherChambres {
        position: absolute;
        top: 0;
        right: -30px;
        background-color: black;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
      }

      #chambres {
        display: none;
        margin-top: 10px;
      }

      #ajouterChambre {
        margin-top: 10px;
      }

      #verifierDisponibilite {
        margin-top: 20px;
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <br /> <br /> <br /> <br /> <br /> <br /> <br />
 <div class="cadre">
      <div class="ligne">
        <div class="champ">
          <label for="dateArrivee">Arrivée :</label>
          <input type="date" id="dateArrivee" name="dateArrivee" runat="server">
        </div>
        <div class="champ">
          <label for="dateDepart">Départ :</label>
          <input type="date" id="dateDepart" name="dateDepart">
        </div>
        <div class="champ">
          <div class="chambreOccupation">
            <label for="chambreOccupation">Chambre et Occupation :</label>
            <button type="button" id="afficherChambres">^</button>
            <div id="chambres" style="display: none;">
              <div class="chambre">
                <label>Chambre 1</label>
                <div>
                  <label for="adultes1"  >Adultes :</label>
                  <select id="adultes1" name="adultes1">
                    <option value="1">1</option>
                    <option value="2" selected>2</option>
                    <option value="3">3</option>
                    <!-- Ajoutez d'autres options si nécessaire -->
                  </select>
                  <label for="enfants1">Enfants :</label>
                  <select id="enfants1" name="enfants1">
                    <option value="0" selected>0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <!-- Ajoutez d'autres options si nécessaire -->
                  </select>
                </div>
              </div>
              <button type="button" id="ajouterChambre">+ Ajouter une chambre</button>
            </div>
          </div>
        </div>
      </div>
      <div class="champ">
        <label for="occupation">Occupation :</label>
        <input type="text" id="occupation" disabled>
      </div>
     <asp:Button id="verifierDisponibilite" Text="Vérifier la disponibilité"  runat="server" />

    </div>

        <script>
            $(document).ready(function() {
                $('#afficherChambres').click(function() {
                    $('#chambres').toggle();
                });

                $('#verifierDisponibilite').click(function() {
                    // Vérifier la disponibilité ici
                });
            });

            document.addEventListener('DOMContentLoaded', function() {
                const inputOccupation = document.getElementById('occupation');

                $(document).on('change', 'select[id^="adultes"], select[id^="enfants"]', updateOccupation);
                $(document).on('click', '#ajouterChambre', updateOccupation);

                function updateOccupation() {
                    const chambreText = getChambreText();
                    const totalAdultes = getTotalAdultes();
                    const totalEnfants = getTotalEnfants();
                    const totalChambres = getTotalChambres();
                    inputOccupation.value = chambreText + ', ' + totalChambres + ' chambre(s), ' + totalAdultes + ' adulte(s), ' + totalEnfants + ' enfant(s)';
                }
            });

            $(document).ready(function() {
                var chambreIndex = 2; // Commencez à partir de la deuxième chambre

                $("#ajouterChambre").click(function() {
                    var nouvelleChambre = `
                      <div class="chambre">
                        <label>Chambre ${chambreIndex}</label>
                        <div>
                          <label for="adultes${chambreIndex}">Adultes :</label>
                          <select id="adultes${chambreIndex}" name="adultes${chambreIndex}">
                            <option value="1">1</option>
                            <option value="2" selected>2</option>
                            <option value="3">3</option>
                            <!-- Ajoutez d'autres options si nécessaire -->
                          </select>
                          <label for="enfants${chambreIndex}">Enfants :</label>
                          <select id="enfants${chambreIndex}" name="enfants${chambreIndex}">
                            <option value="0" selected>0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <!-- Ajoutez d'autres options si nécessaire -->
                          </select>
                        </div>
                      </div>
                  `;

                    $("#chambres").append(nouvelleChambre);

                    chambreIndex++;
                });
            });

            function getTotalAdultes() {
                let total = 0;
                const chambres = document.getElementsByClassName('chambre');
                for (let i = 0; i < chambres.length; i++) {
                    const chambre = chambres[i];
                    const selectAdultes = chambre.querySelector('select[id^="adultes"]');
                    total += parseInt(selectAdultes.value);
                }
                return total;
            }

            function getTotalEnfants() {
                let total = 0;
                const chambres = document.getElementsByClassName('chambre');
                for (let i = 0; i < chambres.length; i++) {
                    const chambre = chambres[i];
                    const selectEnfants = chambre.querySelector('select[id^="enfants"]');
                    total += parseInt(selectEnfants.value);
                }
                return total;
            }

            function getTotalChambres() {
                const chambres = document.getElementsByClassName('chambre');
                return chambres.length;
            }

            function getChambreText() {
                const chambres = document.getElementsByClassName('chambre');
                let chambreText = '';
                for (let i = 0; i < chambres.length; i++) {
                    chambreText += 'Chambre ' + (i + 1);
                    if (i !== chambres.length - 1) {
                        chambreText += ', ';
                    }
                }
                return chambreText;
            }

    </script>
      
</asp:Content>
