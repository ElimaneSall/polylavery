import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/model/dashboard.dart';
import 'package:polylavery/screen/dashboardScreen.dart';
import 'package:polylavery/services/commandeService.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:polylavery/widget/DashboardWidget.dart';
import 'package:polylavery/widget/lavageForAdminWidget.dart';
import 'package:polylavery/widget/lavageWidget.dart';

class AccueilAdmin extends StatefulWidget {
  const AccueilAdmin({super.key});

  @override
  State<AccueilAdmin> createState() => _AccueilAdminState();
}

class _AccueilAdminState extends State<AccueilAdmin> {
  List<String> filtedList = [
    "Tout",
    "Endettement",
    "En cours",
    "Receptionné",
    "livré"
  ];

  CommandeService commandeService = CommandeService();
  String selectedValue = "Tout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
        backgroundColor: AppColor.primary,
        title: const Text(
          "JEP - PolyLavery",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const DashboardScreen()));
        },
        child: const Icon(Icons.dashboard),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.05,
            horizontal: MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Bonjour Manager",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.07),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Dashboard>>(
                    future: commandeService.getDashboardData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          value: 2,
                          strokeWidth: 2,
                        );
                      } else if (snapshot.hasError) {
                        return Text('Erreur : ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return Text('Aucun statistique trouvé.');
                      } else {
                        List<Dashboard> bilans = snapshot.data!;

                        return Row(
                          children: [for (var i in bilans) DashboardWidget(i)],
                        );
                      }
                    })),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Historique des lavages",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
                DropdownButton(
                  value: selectedValue,
                  items: filtedList
                      .map((item) => DropdownMenuItem<String>(
                            child: Text(item),
                            value: item,
                          ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedValue = item!),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            FutureBuilder<List<Commande>>(
                future: commandeService.getAllCommande(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      value: 2,
                      strokeWidth: 2,
                    );
                  } else if (snapshot.hasError) {
                    return Text('Erreur : ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('Aucun lavage trouvé.');
                  } else {
                    List<Commande> commandesAnciennes = snapshot.data!;

                    return Column(
                      children: [
                        for (var i in commandesAnciennes)
                          LavageForAdminWidget(i)
                      ],
                    );
                  }
                })
          ],
        ),
      ))),
    );
  }
}
