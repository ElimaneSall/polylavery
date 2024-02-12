import 'package:flutter/material.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/screen/detailCommandeUser.dart';
import 'package:polylavery/services/commandeService.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:polylavery/utils/method.dart';
import 'package:polylavery/widget/DetailWidget.dart';

class LavageWidget extends StatelessWidget {
  Commande commande;

  LavageWidget(this.commande, {super.key});

  CommandeService commandeService = CommandeService();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailCommandeUser(commande.idCommande)));
        //   showDialog(
        //       context: context,
        //       builder: (context) => AlertDialog(
        //           title: const Center(
        //               child: Text(
        //             "Détail de la commande",
        //             textAlign: TextAlign.center,
        //           )),
        //           content: FutureBuilder<Commande>(
        //               future: commandeService
        //                   .getDetailCommande(commande.idCommande),
        //               builder: (context, snapshot) {
        //                 if (snapshot.connectionState ==
        //                     ConnectionState.waiting) {
        //                   return const CircularProgressIndicator(
        //                     value: 0.1,
        //                     strokeWidth: 0.1,
        //                   );
        //                 } else if (snapshot.hasError) {
        //                   return Text('Erreur : ${snapshot.error}');
        //                 } else if (!snapshot.hasData) {
        //                   return Text('Aucun lavage trouvé.');
        //                 } else {
        //                   Commande detailCommande = snapshot.data!;

        //                   return DetailWidget(detailCommande);
        //                 }
        //               })));
        },
        child: Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              bottom: MediaQuery.of(context).size.width * 0.03,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          color: commande.etat == "En cours"
                              ? Colors.yellow
                              : AppColor.white,
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
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      timeAgoCustom(
                          DateTime.parse(commande.date.toDate().toString())),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ))
              ],
            )));
  }
}
