import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Commande {
  String idCommande = "";
  String typeLavage = "";
  String moyenPaiement = "";
  String etat = "";
  Timestamp date = Timestamp.now();
  double nbreKilo = 0.0;
  double tarif = 400;
  double montantRemis = 0.0;
  double montantTotal = 0.0;
  String prenom = "";
  String nom = "";
  String promo = "";
  String telephone = "";
  String email = "";
  String idUser = "";
   Timestamp? dateReception = null;
   Timestamp? dateDebutTraitement =null;
   Timestamp? dateFinTraitement =null;
   Timestamp? dateLivraison = null;

  Commande(
      {required this.idCommande,
      required this.typeLavage,
      required this.etat,
      required this.date,
      required this.nbreKilo,
      required this.tarif,
      required this.montantRemis,
      required this.montantTotal,
      required this.prenom,
      required this.nom,
      required this.telephone,
      required this.email,
      required this.promo,
      required this.moyenPaiement,
      required this.idUser,
      required this.dateReception,
      required this.dateDebutTraitement,
      required this.dateFinTraitement,
      required this.dateLivraison});

  Commande.fromJson(Map<String, dynamic> json) {
    idCommande = json["idCommande"] ?? "";
    typeLavage = json["typeLavage"] ?? "";
    etat = json["etat"] ?? "";
    date = json["date"] ?? "";
    nbreKilo = json["nbreKilo"] ?? "";
    tarif = json["tarif"] ?? "";
    prenom = json["prenom"] ?? "";
    nom = json["nom"] ?? "";
    telephone = json["telephone"] ?? "";
    email = json["email"] ?? "";
    promo = json["promo"] ?? "";
    moyenPaiement = json["moyenPaiement"] ?? "";
    idUser = json["idUser"] ?? "";
    dateReception = json["dateReception"] ?? "";
    dateDebutTraitement = json["dateDebutTraitement"] ?? "";
    dateFinTraitement = json["dateFinTraitement"] ?? "";
    dateLivraison = json["dateLivraison"] ?? "";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idCommande"] = idCommande;
    data["typeLavage"] = typeLavage;
    data["etat"] = etat;
    data["date"] = date;
    data["nbreKilo"] = nbreKilo;
    data["tarif"] = tarif;
    data["prenom"] = prenom;
    data["nom"] = nom;
    data["telephone"] = telephone;
    data["email"] = email;
    data["promo"] = promo;
    data["moyenPaiement"] = moyenPaiement;
    data["montantRemis"] = montantRemis;
    data["montantTotal"] = montantTotal;
    data["idUser"] = idUser;
    data["dateReception"] = dateReception;
    data["dateDebutTraitement"] = dateDebutTraitement;
    data["dateFinTraitement"] = dateFinTraitement;
    data["dateLivraison"] = dateLivraison;

    return data;
  }
}
