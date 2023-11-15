using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Reservation
{
    public partial class hotelreservation : System.Web.UI.Page
    {

        SqlConnection con = Global.connection;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

//        protected void verifierDisponibilite_Click1(object sender, EventArgs e)
//{
//    // Récupérer les valeurs sélectionnées par l'utilisateur
//    int nombreChambres = 1; // Au moins une chambre est sélectionnée
//    int nombreAdultes = int.Parse(adultes1.SelectedItem.Value);

//    // Déterminer le type de chambre en fonction du nombre d'adultes
//    string typeChambre = GetTypeChambre(nombreChambres, nombreAdultes);

//    // Construire la requête SQL pour récupérer les chambres disponibles
//    string query = "SELECT * FROM Chambre WHERE type = @TypeChambre";

//    // Créer une instance de SqlConnection et SqlCommand
   
//        SqlCommand command = new SqlCommand(query, con);
//        command.Parameters.AddWithValue("@TypeChambre", typeChambre);

//        // Ouvrir la connexion à la base de données
       

//        // Exécuter la requête SQL et récupérer les résultats dans un SqlDataReader
//        SqlDataReader reader = command.ExecuteReader();

//        // Afficher ou stocker les chambres disponibles selon vos besoins
//        while (reader.Read())
//        {
//            // Lire les données de chaque chambre
//            int idChambre = (int)reader["IdCH"];
//            int nombreChambre = (int)reader["nombrechambre"];
//            string type = (string)reader["type"];
//            // ... Lire d'autres colonnes si nécessaire

//            // Afficher ou stocker les données de chaque chambre selon vos besoins
//            // Par exemple, vous pouvez les stocker dans une liste d'objets Chambre personnalisés
//            Chambre chambre = new Chambre(idChambre, nombreChambre, type);
//            // Ajouter la chambre à une liste ou la traiter autrement

//            // Afficher les données de chaque chambre dans la console pour le débogage
//            Console.WriteLine("IdChambre: {idChambre}, NombreChambre: {nombreChambre}, Type: {type}");
//        }

//        // Fermer le SqlDataReader et la connexion à la base de données
//        reader.Close();
      
   
//}

//private string GetTypeChambre(int nombreChambres, int nombreAdultes)
//{
//    // Logique pour déterminer le type de chambre en fonction du nombre de chambres et du nombre d'adultes
//    if (nombreChambres == 1 && nombreAdultes == 1)
//    {
//        return "single";
//    }
//    else if (nombreChambres == 1 && nombreAdultes == 2)
//    {
//        return "double";
//    }
//    else if (nombreChambres == 2 && nombreAdultes == 6)
//    {
//        return "familiale";
//    }
//    else
//    {
//        // Retourner un type de chambre par défaut si les critères ne correspondent à aucun cas spécifique
//        return "autre";
//    }
//}

//public class Chambre
//{
//    public int IdChambre { get; set; }
//    public int NombreChambre { get; set; }
//    public string Type { get; set; }

//    public Chambre(int idChambre, int nombreChambre, string type)
//    {
//        IdChambre = idChambre;
//        NombreChambre = nombreChambre;
//        Type = type;
//    }
//}



    }
}