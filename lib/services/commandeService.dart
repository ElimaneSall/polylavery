import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/model/dashboard.dart';

class CommandeService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // String uid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> postCommande(Commande commande) async {
    try {
      CollectionReference commandeCollection = firestore.collection("COMMANDE");
      await commandeCollection.doc(commande.idCommande).set(commande.toJson());

      // Affichez un message ou effectuez une action supplémentaire après l'ajout réussi
      print("Commande ajoutée avec succès !");
    } catch (e) {
      print("Erreur lors de l'ajout de l'alerte : $e");
    }
  }

  Future<void> updateCommande(
      String idCommande, dynamic newValue, String champ) async {
    try {
      CollectionReference commandeCollection =
          FirebaseFirestore.instance.collection("COMMANDE");

      await commandeCollection.doc(idCommande).update({champ: newValue});
      print("Commande modifier avec success!");
    } catch (e) {
      print("Erreur lors de la modification de la commande : $e");
    }
  }

  Future<List<Commande>> getAllCommande() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("COMMANDE")
              .orderBy("date", descending: true)
              .get();
      List<Commande> busList = await querySnapshot.docs
          .map((doc) => Commande(
                idUser: FirebaseAuth.instance.currentUser!.uid,
                moyenPaiement: doc.data()['moyenPaiement'],
                nom: doc.data()['nom'],
                typeLavage: doc.data()['typeLavage'],
                prenom: doc.data()['prenom'],
                email: doc.data()['email'],
                etat: doc.data()['etat'],
                date: doc.data()['date'],
                nbreKilo: doc.data()['nbreKilo'],
                tarif: doc.data()['tarif'],
                montantRemis: doc.data()['montantRemis'],
                montantTotal: doc.data()['montantTotal'],
                telephone: doc.data()['telephone'],
                promo: doc.data()['promo'],
                idCommande: doc.data()['idCommande'],
                dateReception: doc.data()['dateReception'],
                dateDebutTraitement: doc.data()['dateDebutTraitement'],
                dateFinTraitement: doc.data()['dateFinTraitement'],
                dateLivraison: doc.data()['dateLivraison'],
              ))
          .toList();

      return busList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Commande>> getRecentsCommande() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("COMMANDE")
              .orderBy("date", descending: true)
              .limit(3)
              .get();
      List<Commande> busList = await querySnapshot.docs
          .map((doc) => Commande(
                idUser: FirebaseAuth.instance.currentUser!.uid,
                moyenPaiement: doc.data()['moyenPaiement'],
                // id: doc.id,
                nom: doc.data()['nom'],
                typeLavage: doc.data()['typeLavage'],
                prenom: doc.data()['prenom'],
                email: doc.data()['email'],
                etat: doc.data()['etat'],
                date: doc.data()['date'],
                nbreKilo: doc.data()['nbreKilo'],
                tarif: doc.data()['tarif'],
                montantRemis: doc.data()['montantRemis'],
                montantTotal: doc.data()['montantTotal'],
                telephone: doc.data()['telephone'],
                promo: doc.data()['promo'],
                idCommande: doc.data()['idCommande'],
                dateReception: doc.data()['dateReception'],
                dateDebutTraitement: doc.data()['dateDebutTraitement'],
                dateFinTraitement: doc.data()['dateFinTraitement'],
                dateLivraison: doc.data()['dateLivraison'],
              ))
          .toList();

      return busList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Commande>> getRecentsCommandeUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore
              .instance
              .collection("COMMANDE")
              .orderBy("date", descending: true)
              .where("idUser",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(3)
              .get();
      List<Commande> busList = await querySnapshot.docs
          .map((doc) => Commande(
                idUser: FirebaseAuth.instance.currentUser!.uid,
                moyenPaiement: doc.data()['moyenPaiement'],
                // id: doc.id,
                nom: doc.data()['nom'],
                typeLavage: doc.data()['typeLavage'],
                prenom: doc.data()['prenom'],
                email: doc.data()['email'],
                etat: doc.data()['etat'],
                date: doc.data()['date'],
                nbreKilo: doc.data()['nbreKilo'],
                tarif: doc.data()['tarif'],
                montantRemis: doc.data()['montantRemis'],
                montantTotal: doc.data()['montantTotal'],
                telephone: doc.data()['telephone'],
                promo: doc.data()['promo'],
                idCommande: doc.data()['idCommande'],
                dateReception: doc.data()['dateReception'],
                dateDebutTraitement: doc.data()['dateDebutTraitement'],
                dateFinTraitement: doc.data()['dateFinTraitement'],
                dateLivraison: doc.data()['dateLivraison'],
              ))
          .toList();

      return busList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Commande>> getAllCommandeUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore
              .instance
              .collection("COMMANDE")
              .orderBy("date", descending: true)
              .where("idUser",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get();
      List<Commande> busList = await querySnapshot.docs
          .map((doc) => Commande(
                idUser: FirebaseAuth.instance.currentUser!.uid,
                moyenPaiement: doc.data()['moyenPaiement'],
                nom: doc.data()['nom'],
                typeLavage: doc.data()['typeLavage'],
                prenom: doc.data()['prenom'],
                email: doc.data()['email'],
                etat: doc.data()['etat'],
                date: doc.data()['date'],
                nbreKilo: doc.data()['nbreKilo'],
                tarif: doc.data()['tarif'],
                montantRemis: doc.data()['montantRemis'],
                montantTotal: doc.data()['montantTotal'],
                telephone: doc.data()['telephone'],
                promo: doc.data()['promo'],
                idCommande: doc.data()['idCommande'],
                dateReception: doc.data()['dateReception'],
                dateDebutTraitement: doc.data()['dateDebutTraitement'],
                dateFinTraitement: doc.data()['dateFinTraitement'],
                dateLivraison: doc.data()['dateLivraison'],
              ))
          .toList();

      return busList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Commande> getDetailCommande(String commandeId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await FirebaseFirestore.instance
              .collection("COMMANDE")
              .doc(commandeId)
              .get();

      if (docSnapshot.exists) {
        Commande commande = Commande(
          idUser: FirebaseAuth.instance.currentUser!.uid,
          moyenPaiement: docSnapshot.data()!['moyenPaiement'],
          // id: docSnapshot.id,
          nom: docSnapshot.data()!['nom'],
          typeLavage: docSnapshot.data()!['typeLavage'],
          prenom: docSnapshot.data()!['prenom'],
          email: docSnapshot.data()!['email'],
          etat: docSnapshot.data()!['etat'],
          date: docSnapshot.data()!['date'],
          nbreKilo: docSnapshot.data()!['nbreKilo'],
          tarif: docSnapshot.data()!['tarif'],
          montantRemis: docSnapshot.data()!['montantRemis'],
          montantTotal: docSnapshot.data()!['montantTotal'],
          telephone: docSnapshot.data()!['telephone'],
          promo: docSnapshot.data()!['promo'],
          idCommande: docSnapshot.data()!['idCommande'],
          dateReception: docSnapshot.data()!['dateReception'],
          dateDebutTraitement: docSnapshot.data()!['dateDebutTraitement'],
          dateFinTraitement: docSnapshot.data()!['dateFinTraitement'],
          dateLivraison: docSnapshot.data()!['dateLivraison'],
        );
        return commande;
      } else {
        return Commande(
          idCommande: "",
          typeLavage: "",
          etat: "",
          date: Timestamp.now(),
          nbreKilo: 0,
          tarif: 0,
          montantRemis: 0,
          montantTotal: 0,
          prenom: "",
          nom: "",
          telephone: "",
          email: "",
          promo: "",
          moyenPaiement: "",
          idUser: "",
          dateReception: null,
          dateDebutTraitement: null,
          dateFinTraitement: null,
          dateLivraison: null,
        ); // Aucune commande trouvée avec cet identifiant
      }
    } catch (e) {
      print(e.toString());
      return Commande(
        idCommande: "",
        typeLavage: "",
        etat: "",
        date: Timestamp.now(),
        nbreKilo: 0,
        tarif: 0,
        montantRemis: 0,
        montantTotal: 0,
        prenom: "",
        nom: "",
        telephone: "",
        email: "",
        promo: "",
        moyenPaiement: "",
        idUser: "",
        dateReception: null,
        dateDebutTraitement: null,
        dateFinTraitement: null,
        dateLivraison: null,
      );
      ; // Une erreur s'est produite lors de la récupération de la commande
    }
  }

  // Future<Dashboard> dashboardData() async {
  //   try {
  //     List<Commande> commandes = await getAllCommande();
  //     double nbreTotalKilo = 0;
  //     double montantTotal = 0;
  //     double montantTotalRemis = 0;
  //     int nbreTotalCommande = commandes.length;

  //     for (Commande commande in commandes) {
  //       nbreTotalKilo += commande.nbreKilo;
  //       montantTotal += commande.montantTotal;
  //       montantTotalRemis += commande.montantRemis;
  //     }
  //     return Dashboard(
  //         frequence: "Journalière",
  //         nbreTotalKilo: nbreTotalKilo,
  //         montantTotal: montantTotal,
  //         montantRemis: montantTotalRemis,
  //         nbreTotalCommande: nbreTotalCommande);
  //     //   'nbreTotalKilo': nbreTotalKilo,
  //     //   'montantTotal': montantTotal,
  //     //   'montantDette': montantDette,
  //     //   'nbreTotalCommande': nbreTotalCommande,
  //   } catch (e) {
  //     print(e.toString());
  //     return Dashboard(
  //         frequence: "",
  //         nbreTotalKilo: 0,
  //         montantTotal: 0,
  //         montantRemis: 0,
  //         nbreTotalCommande: 0);
  //   }
  // }

  Future<List<Dashboard>> getDashboardData() async {
    try {
      List<Commande> commandes = await getAllCommande();
      List<Dashboard> dashboards = [];

      dashboards.add(_calculateDashboardForPeriod(commandes, "Journalier"));
      dashboards.add(_calculateDashboardForPeriod(commandes, "Hebdomadaire"));

      dashboards.add(_calculateDashboardForPeriod(commandes, "Mensuel"));
      dashboards.add(_calculateDashboardForPeriod(commandes, "Global"));
      return dashboards;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Dashboard> getDashboardDataForPeriode(String periode) async {
    try {
      List<Commande> commandes = await getAllCommandeUser();
      Dashboard dashboards;
      dashboards = _calculateDashboardForPeriod(commandes, periode);
      return dashboards;
    } catch (e) {
      print(e.toString());
      return Dashboard(
          frequence: "",
          nbreTotalKilo: 0,
          montantTotal: 0,
          montantRemis: 0,
          nbreTotalCommande: 0);
    }
  }

  Dashboard _calculateDashboardForPeriod(
      List<Commande> commandes, String periode) {
    List<Commande> filteredCommandes = [];
    Timestamp now = Timestamp.now();

    switch (periode) {
      case "Journalier":
        filteredCommandes = commandes
            .where((commande) => _isSameDay(commande.date, now))
            .toList();
        break;
      case "Hebdomadaire":
        filteredCommandes = commandes
            .where((commande) => _isSameWeek(commande.date, now))
            .toList();
        break;
      case "Mensuel":
        filteredCommandes = commandes
            .where((commande) => _isSameMonth(commande.date, now))
            .toList();
        break;
      case "Global":
        filteredCommandes = commandes;
        break;
    }

    double nbreTotalKilo = 0;
    double montantTotal = 0;
    double montantTotalRemis = 0;
    int nbreTotalCommande = filteredCommandes.length;

    for (Commande commande in filteredCommandes) {
      nbreTotalKilo += commande.nbreKilo;
      montantTotal += commande.montantTotal;
      montantTotalRemis += commande.montantRemis;
    }

    return Dashboard(
      frequence: periode,
      nbreTotalKilo: nbreTotalKilo,
      montantTotal: montantTotal,
      montantRemis: montantTotalRemis,
      nbreTotalCommande: nbreTotalCommande,
    );
  }

  bool _isSameDay(Timestamp date1, Timestamp date2) {
    DateTime dateTime1 = date1.toDate();
    DateTime dateTime2 = date2.toDate();
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month &&
        dateTime1.day == dateTime2.day;
  }

  bool _isSameMonth(Timestamp date1, Timestamp date2) {
    DateTime dateTime1 = date1.toDate();
    DateTime dateTime2 = date2.toDate();
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month;
  }

  bool _isSameWeek(Timestamp date1, Timestamp date2) {
    DateTime dateTime1 = date1.toDate();
    DateTime dateTime2 = date2.toDate();

    // Calculer les numéros de semaine en utilisant les valeurs ISO-8601 (lundi = 1, dimanche = 7)
    int weekNumber1 = _getISOWeekNumber(dateTime1);
    int weekNumber2 = _getISOWeekNumber(dateTime2);

    return weekNumber1 == weekNumber2;
  }

  int _getISOWeekNumber(DateTime date) {
    // Algorithme pour calculer le numéro de semaine ISO-8601
    DateTime janFirst = DateTime(date.year, 1, 1);
    int daysOffset = janFirst.weekday - 1;
    DateTime firstMondayOfYear = janFirst.subtract(Duration(days: daysOffset));
    int daysSinceFirstMonday = date.difference(firstMondayOfYear).inDays;
    return 1 + (daysSinceFirstMonday / 7).floor();
  }
  // Future<User> getUser() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection("USER")
  //             .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //             .get();
  //     List<Commande> busList = await querySnapshot.docs.first.data();

  //     return busList;
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }
}
