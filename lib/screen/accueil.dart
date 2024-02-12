import 'package:flutter/material.dart';
import 'package:polylavery/model/commande.dart';
import 'package:polylavery/model/dashboard.dart';
import 'package:polylavery/screen/AcceuilAdmin.dart';
import 'package:polylavery/screen/addCommand.dart';
import 'package:polylavery/services/commandeService.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:polylavery/utils/openUrl.dart';
import 'package:polylavery/widget/DashboardWidget.dart';
import 'package:polylavery/widget/lavageWidget.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  CommandeService commandeService = CommandeService();
  OpenURL openURL = OpenURL();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.0125,
        ),
        Image.asset('assets/images/logo_jep2.png',
            height: MediaQuery.sizeOf(context).height * 0.15,
            width: MediaQuery.sizeOf(context).height * 0.5),
        Divider(),
        ListTile(
          leading: const Icon(Icons.home, color: Colors.black),
          title: const Text("Accueil"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Accueil()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.call, color: Colors.black),
          title: const Text("Nous contacter"),
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const NousContacter()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.help, color: Colors.black),
          title: const Text("Besoin d'aide"),
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => const Aide()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.black),
          title: const Text("Paramètres"),
          onTap: () {},
        ),
        Divider(),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.sizeOf(context).height * 0.025),
          child: Text(
            "Suivez-nous",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.025,
                color: Colors.black),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.0125,
        ),
        Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    openURL.mylaunchUrl(
                        "https://www.linkedin.com/company/junior-entreprise-polytech-ept/");
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.16,
                    child: Image.asset(
                      'assets/images/linkedin.jpg',
                    ),
                  )),
              SizedBox(
                width: MediaQuery.sizeOf(context).height * 0.025,
              ),
              GestureDetector(
                  onTap: () {
                    openURL.mylaunchUrl("https://m.facebook.com/JEP.EPT/");
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.12,
                    child: Image.asset(
                      'assets/images/facebook.png',
                    ),
                  )),
              SizedBox(
                width: MediaQuery.sizeOf(context).height * 0.025,
              ),
              GestureDetector(
                  onTap: () {
                    openURL.mylaunchUrl("https://twitter.com/JuniorPolytech");
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    child: Image.asset(
                      'assets/images/x.jpg',
                    ),
                  )),
              SizedBox(
                width: MediaQuery.sizeOf(context).height * 0.025,
              ),
            ]),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.0125,
        ),
      ])),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () async {
              setState(() {});
              // await FirebaseAuth.instance.signOut().then((value) async {
              //   print("Deconnecter");
              //   final Future<SharedPreferences> _infosUserShared =
              //       SharedPreferences.getInstance();
              //   SharedPreferences prefs = await _infosUserShared;
              //   exit(0);
              //   // prefs.remove("password");
              //   // prefs.remove("email");
              //   // Navigator.push(
              //   //     context, MaterialPageRoute(builder: (context) => SignIn()));
              // });
            },
          )
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCommand()));
        },
        child: const Icon(Icons.edit),
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
                "Hello!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.07),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const AccueilAdmin()));
            //     },
                // child:
                 FutureBuilder<Dashboard>(
                    future:
                        commandeService.getDashboardDataForPeriode("Global"),
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
                        Dashboard bilans = snapshot.data!;

                        return DashboardWidget(bilans);
                      }
                    }),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Récents lavages",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Commande>>(
                    future: commandeService.getRecentsCommandeUser(),
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
                        List<Commande> commandesRecentes = snapshot.data!;

                        return commandesRecentes.isEmpty
                            ? const Text("Aucun lavage trouvé")
                            : Row(
                                children: [
                                  for (var i in commandesRecentes)
                                    LavageWidget(i)
                                ],
                              );
                      }
                    })),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Historique des lavages",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            FutureBuilder<List<Commande>>(
                future: commandeService.getAllCommandeUser(),
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
                        for (var i in commandesAnciennes) LavageWidget(i)
                      ],
                    );
                  }
                })

            // for (var i in commandesAnciennes) LavageWidget(i)
          ],
        ),
      ))),
    );
  }
}
