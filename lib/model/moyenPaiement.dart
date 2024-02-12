import 'package:flutter/material.dart';

class MoyenPaiement {
  late int id;
  String libelle = "";

  MoyenPaiement({
    required this.libelle,
  });

  MoyenPaiement.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    libelle = json["libelle"] ?? "";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["libelle"] = libelle;

    return data;
  }
}
