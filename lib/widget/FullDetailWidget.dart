import 'package:flutter/material.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:polylavery/utils/method.dart';

class FullDetailWidget extends StatelessWidget {
  Commande commande;

  FullDetailWidget(this.commande, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          // right: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.width * 0.03,
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        decoration: BoxDecoration(
            color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${commande.prenom} ${commande.nom} ${commande.promo} ème",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  commande.typeLavage,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  commande.etat,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "- ${commande.nbreKilo.toStringAsFixed(2)} kg",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "- ${commande.tarif.toStringAsFixed(2)} FCFA",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              "Paiement",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- ${commande.montantTotal.toStringAsFixed(2)}FCFA",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      Text(
                        "Par ${commande.moyenPaiement}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      )
                    ])),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- ${(commande.montantTotal - commande.montantRemis).toStringAsFixed(2)} FCFA",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      Text(
                        "comme dette",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      )
                    ])),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              "Les états de votre commande",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Reception",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      Text(
                        "-------28/01/2024 à 21h19min",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      )
                    ])),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Début traitement",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                    Text(
                      "---28/01/2024 à 21h19min",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- Fin traitement",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                    Text(
                      "---28/01/2024 à 21h19min",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Livraison",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      Text(
                        "-------28/01/2024 à 21h19min",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      )
                    ])),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  timeAgoCustom(
                      DateTime.parse(commande.date.toDate().toString())),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                )),
          ],
        ));
  }
}
