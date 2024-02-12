import 'package:flutter/material.dart';
import 'package:polylavery/model/dashboard.dart';
import 'package:polylavery/model/dashboard.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:polylavery/widget/DetailWidget.dart';
import 'package:polylavery/widget/FullDetailWidget.dart';

class DashboardWidget extends StatelessWidget {
  Dashboard dashboard;

  DashboardWidget(this.dashboard, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // onTap: () {
        //   showDialog(
        //       context: context,
        //       builder: (context) => AlertDialog(
        //           title: const Center(
        //               child: Text(
        //             "Détail de la dashboard",
        //             textAlign: TextAlign.center,
        //           )),
        //           content: FullDetailWidget(dashboard)));
        // },
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
                Center(
                  child: Text(
                    "Bilan ${dashboard.frequence} ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Nombre total de kilo",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${dashboard.nbreTotalKilo}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      )
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Montant total",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${dashboard.montantTotal}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      )
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Nombre de commandes traitées",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${dashboard.nbreTotalCommande}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      )
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Montant de la dette",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${dashboard.montantTotal - dashboard.montantRemis}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      )
                    ]),
              ],
            )));
  }
}
