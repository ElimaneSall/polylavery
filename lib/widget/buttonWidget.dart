import 'package:flutter/material.dart';
import 'package:polylavery/services/commandeService.dart';
import 'package:polylavery/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  String idCommande;
  String champ;
  dynamic newValue;
  String titre;
  Color colorButton;
  ButtonWidget(
      this.champ, this.colorButton, this.titre, this.newValue, this.idCommande,
      {super.key});

  CommandeService commandeService = CommandeService();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(
              MediaQuery.sizeOf(context).width * 0.04 > 300
                  ? MediaQuery.sizeOf(context).height * 0.04
                  : MediaQuery.sizeOf(context).width * 0.04)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 2, color: Colors.black),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(colorButton),
          foregroundColor: MaterialStateProperty.all<Color>(AppColor.black),
        ),
        onPressed: () async {
          await commandeService.updateCommande(idCommande, newValue, champ);

          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("La commande a été modifiée avec success")));
        },
        child: Text(titre));
  }
}
