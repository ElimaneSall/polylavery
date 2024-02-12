import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/model/formuleLavage.dart';
import 'package:polylavery/model/moyenPaiement.dart';
import 'package:polylavery/screen/accueil.dart';
import 'package:polylavery/services/commandeService.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AddCommand extends StatefulWidget {
  const AddCommand({super.key});

  @override
  State<AddCommand> createState() => _AddCommandState();
}

class _AddCommandState extends State<AddCommand> {
  List<FormuleLavage> formuleLavages = [
    FormuleLavage(typeLavage: "Petit Lavage", nbreKilo: 3, tarif: 400),
    FormuleLavage(typeLavage: "Moyen Lavage", nbreKilo: 5, tarif: 400),
    FormuleLavage(typeLavage: "Gros Lavage", nbreKilo: 11, tarif: 350),
    FormuleLavage(typeLavage: "Tenue Express", nbreKilo: 1, tarif: 300),
    FormuleLavage(typeLavage: "Non inscrit", nbreKilo: 3, tarif: 500),
  ];
  List<MoyenPaiement> moyenPaiements = [
    MoyenPaiement(libelle: "Orange Money"),
    MoyenPaiement(libelle: "Wave"),
    MoyenPaiement(libelle: "Free Money"),
    MoyenPaiement(libelle: "Liquide"),
    MoyenPaiement(libelle: "Autre")
  ];
  CommandeService commandeService = CommandeService();
  TextEditingController nbreKiloController = TextEditingController();
  TextEditingController montantController = TextEditingController();
  TextEditingController montantRemisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FormuleLavage selectedFormule = formuleLavages.first;
    MoyenPaiement selectedMoyenPaiement = moyenPaiements.first;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: const Text(
            "Passer une commande",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  child: Column(children: [
                    DropdownButtonFormField<FormuleLavage>(
                      // hint: const Text("Sélectionner votre département"),
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        focusColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColor.primary)),
                        labelStyle: TextStyle(
                            color: AppColor.secondary,
                            fontSize: MediaQuery.sizeOf(context).width * 0.028),
                        labelText: "Formule*",
                        fillColor: Colors.red,
                      ),
                      // value: departementState.selectedDepartement,
                      onChanged: (FormuleLavage? newValue) {
                        selectedFormule = newValue!;
                      },
                      items: formuleLavages
                          // items: departementState.itemsDepartement
                          .map<DropdownMenuItem<FormuleLavage>>(
                              (FormuleLavage formuleLavage) {
                        return DropdownMenuItem<FormuleLavage>(
                          value: formuleLavage,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.70,
                            child: Text(formuleLavage.typeLavage),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    TextFormField(
                      controller: nbreKiloController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        focusColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColor.primary)),
                        labelStyle: TextStyle(
                            color: AppColor.secondary,
                            fontSize: MediaQuery.sizeOf(context).width * 0.028),
                        labelText: "Nombre de kilo",
                        hintText: "Entrer le nombre de kilo",
                        fillColor: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    TextFormField(
                      controller: montantController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        focusColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColor.primary)),
                        labelStyle: TextStyle(
                            color: AppColor.secondary,
                            fontSize: MediaQuery.sizeOf(context).width * 0.028),
                        labelText: "Montant total",
                        hintText: "Entrer le montant total du lavage",
                        fillColor: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    TextFormField(
                      controller: montantRemisController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        focusColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColor.primary)),
                        labelStyle: TextStyle(
                            color: AppColor.secondary,
                            fontSize: MediaQuery.sizeOf(context).width * 0.028),
                        labelText: "Montant remis",
                        hintText: "Entrer le montant remis",
                        fillColor: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    DropdownButtonFormField<MoyenPaiement>(
                      // hint: const Text("Sélectionner votre département"),
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        focusColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColor.primary)),
                        labelStyle: TextStyle(
                            color: AppColor.secondary,
                            fontSize: MediaQuery.sizeOf(context).width * 0.028),
                        labelText: "Paiement*",
                        fillColor: Colors.red,
                      ),
                      // value: departementState.selectedDepartement,
                      onChanged: (MoyenPaiement? newValue) {
                        selectedMoyenPaiement = newValue!;
                      },
                      items: moyenPaiements
                          // items: departementState.itemsDepartement
                          .map<DropdownMenuItem<MoyenPaiement>>(
                              (MoyenPaiement moyenPaiement) {
                        return DropdownMenuItem<MoyenPaiement>(
                          value: moyenPaiement,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.70,
                            child: Text(moyenPaiement.libelle),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty
                              .all<EdgeInsetsGeometry>(EdgeInsets.all(
                                  MediaQuery.sizeOf(context).width * 0.04 > 300
                                      ? MediaQuery.sizeOf(context).height * 0.04
                                      : MediaQuery.sizeOf(context).width *
                                          0.04)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  width: 2, color: Colors.black),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColor.primary),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(AppColor.black),
                        ),
                        onPressed: () async {
                          Future<SharedPreferences> _infosUserShared =
                              SharedPreferences.getInstance();
                          SharedPreferences infosUserShared =
                              await _infosUserShared;

                          Commande commande = Commande(
                            idCommande: infosUserShared.getString("email")! +
                                DateTime.now().toString(),
                            moyenPaiement: selectedMoyenPaiement.libelle,
                            prenom: infosUserShared.getString("prenom")!,
                            nom: infosUserShared.getString("nom")!,
                            email: infosUserShared.getString("email")!,
                            etat: "En cours",
                            typeLavage: double.parse(nbreKiloController
                                        .value.text
                                        .toString()) <=
                                    3
                                ? "Petit Lavage"
                                : double.parse(nbreKiloController.value.text
                                            .toString()) <
                                        10
                                    ? "Moyen Lavage"
                                    : "Gros Lavage",
                            date: Timestamp.now(),
                            nbreKilo:
                                double.parse(nbreKiloController.value.text),
                            tarif: double.parse(nbreKiloController.value.text
                                        .toString()) <
                                    10
                                ? 400
                                : 350,
                            montantRemis:
                                double.parse(montantRemisController.value.text),
                            montantTotal:
                                double.parse(montantController.value.text),
                            telephone: infosUserShared.getString("telephone")!,
                            promo: infosUserShared.getString("promo")!,
                            idUser: FirebaseAuth.instance.currentUser!.uid,
                            dateReception: Timestamp.now(),
                            dateDebutTraitement: null,
                            dateFinTraitement: null,
                            dateLivraison: null,
                          );
                          await commandeService.postCommande(commande);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Votre lavage est bien pris en compte")));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Accueil()));
                        },
                        child: const Text("Enregistrer"))
                  ]),
                ))));
  }
}
