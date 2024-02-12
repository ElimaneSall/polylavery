import 'package:flutter/material.dart';

class Dashboard {
  late int id;
  String frequence = "";
  double nbreTotalKilo = 0;
  double montantTotal = 0;
  double montantRemis = 0;
  int nbreTotalCommande = 0;

  Dashboard({
    required this.frequence,
    required this.nbreTotalKilo,
    required this.montantTotal,
    required this.montantRemis,
    required this.nbreTotalCommande,
  });

  Dashboard.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    frequence = json["frequence"] ?? "";
    nbreTotalKilo = json["nbreTotalKilo"] ?? "";
    montantTotal = json["montantTotal"] ?? "";
    montantRemis = json["montantRemis"] ?? "";
    nbreTotalCommande = json["nbreTotalCommande"] ?? "";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["frequence"] = frequence;
    data["nbreTotalKilo"] = nbreTotalKilo;
    data["montantTotal"] = montantTotal;
    data["montantRemis"] = montantRemis;
    data["nbreTotalCommande"] = nbreTotalCommande;

    return data;
  }
}
