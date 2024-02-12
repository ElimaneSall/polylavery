import 'package:flutter/material.dart';

class FormuleLavage {
  late int id;
  String typeLavage = "";
  late double nbreKilo = 0;
   double tarif = 400;

  FormuleLavage({
    required this.typeLavage,
    required this.nbreKilo,
    required this.tarif,
  });

  FormuleLavage.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    typeLavage = json["typeLavage"] ?? "";
    nbreKilo = json["nbreKilo"] ?? "";
    tarif = json["tarif"] ?? "";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["typeLavage"] = typeLavage;
    data["nbreKilo"] = nbreKilo;
    data["tarif"] = tarif;

    return data;
  }
}
