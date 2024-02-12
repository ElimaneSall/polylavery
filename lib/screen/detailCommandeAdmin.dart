import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/services/commandeService.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:polylavery/utils/method.dart';
import 'package:polylavery/widget/buttonWidget.dart';

class DetailCommandeAdmin extends StatefulWidget {
  String _idCommande;

  DetailCommandeAdmin(this._idCommande, {super.key});

  @override
  State<DetailCommandeAdmin> createState() =>
      _DetailCommandeAdminState(_idCommande);
}

class _DetailCommandeAdminState extends State<DetailCommandeAdmin> {
  String idCommande;
  _DetailCommandeAdminState(this.idCommande);

  CommandeService commandeService = CommandeService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Détail de la commande"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
            child: FutureBuilder<Commande>(
                future: commandeService.getDetailCommande(idCommande),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      value: 0.1,
                      strokeWidth: 0.1,
                    );
                  } else if (snapshot.hasError) {
                    return Text('Erreur : ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return Text('Aucun lavage trouvé.');
                  } else {
                    Commande detailCommande = snapshot.data!;

                    return Container(
                        margin: EdgeInsets.only(
                          // right: MediaQuery.of(context).size.width * 0.03,
                          bottom: MediaQuery.of(context).size.width * 0.03,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.02,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        decoration: BoxDecoration(
                            // color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${detailCommande.prenom} ${detailCommande.nom.toUpperCase()} ${detailCommande.promo} ème",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detailCommande.typeLavage,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      detailCommande.etat,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          color:
                                              detailCommande.etat == "En cours"
                                                  ? Colors.orange
                                                  : AppColor.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          commandeService.updateCommande(
                                              idCommande,
                                              detailCommande.etat == "En cours"
                                                  ? "Terminée"
                                                  : "En cours",
                                              "etat");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "La commande a été modifiée avec success")));
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.swipe,
                                          color: AppColor.primary,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "- ${detailCommande.nbreKilo.toStringAsFixed(2)} kg",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "- ${detailCommande.tarif.toStringAsFixed(2)} FCFA",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              "Paiement",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "- ${detailCommande.montantTotal.toStringAsFixed(2)}FCFA",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                      Text(
                                        "Par ${detailCommande.moyenPaiement}",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )
                                    ])),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "- ${(detailCommande.montantTotal - detailCommande.montantRemis).toStringAsFixed(2)} FCFA",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                      Text(
                                        "comme dette",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )
                                    ])),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Les états de la commande",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              title: const Center(
                                                  child: Text(
                                                "Changer le statut",
                                                textAlign: TextAlign.center,
                                              )),
                                              content: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (detailCommande
                                                              .dateReception ==
                                                          null)
                                                        ButtonWidget(
                                                          "dateReception",
                                                          AppColor.primary,
                                                          "Reception",
                                                          Timestamp.now(),
                                                          detailCommande
                                                              .idCommande,
                                                        ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      if (detailCommande
                                                              .dateDebutTraitement ==
                                                          null)
                                                        ButtonWidget(
                                                          "dateDebutTraitement",
                                                          Colors.orange,
                                                          "Début traitement",
                                                          Timestamp.now(),
                                                          detailCommande
                                                              .idCommande,
                                                        ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      if (detailCommande
                                                              .dateFinTraitement ==
                                                          null)
                                                        ButtonWidget(
                                                          "dateFinTraitement",
                                                          Colors.yellow,
                                                          "Fin traitement",
                                                          Timestamp.now(),
                                                          detailCommande
                                                              .idCommande,
                                                        ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      if (detailCommande
                                                              .dateLivraison ==
                                                          null)
                                                        ButtonWidget(
                                                          "dateLivraison",
                                                          Colors.green,
                                                          "Livraison",
                                                          Timestamp.now(),
                                                          detailCommande
                                                              .idCommande,
                                                        ),
                                                      if (detailCommande.dateReception != null &&
                                                          detailCommande
                                                                  .dateDebutTraitement !=
                                                              null &&
                                                          detailCommande
                                                                  .dateFinTraitement !=
                                                              null &&
                                                          detailCommande
                                                                  .dateLivraison !=
                                                              null)
                                                        const Text(
                                                            "La commande a été cloturée!")
                                                    ],
                                                  ))));
                                    },
                                    icon: const Icon(Icons.open_in_new))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "- Reception",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                      Text(
                                        detailCommande.dateReception != null
                                            ? formatTimestamp(
                                                detailCommande.dateReception!)
                                            : "-",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )
                                    ])),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "- Début traitement",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                    ),
                                    Text(
                                      detailCommande.dateDebutTraitement != null
                                          ? formatTimestamp(detailCommande
                                              .dateDebutTraitement!)
                                          : "-",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "- Fin traitement",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                    ),
                                    Text(
                                      detailCommande.dateFinTraitement != null
                                          ? formatTimestamp(
                                              detailCommande.dateFinTraitement!)
                                          : "-",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "- Livraison",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                      Text(
                                        detailCommande.dateLivraison != null
                                            ? formatTimestamp(
                                                detailCommande.dateLivraison!)
                                            : "-",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      )
                                    ])),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: ButtonWidget("", AppColor.primary,
                                    "Notifier le client", "", ""))
                          ],
                        ));
                  }
                })));
    ;
  }
}
