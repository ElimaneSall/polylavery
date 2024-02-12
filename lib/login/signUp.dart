import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polylavery/screen/accueil.dart';
import 'package:polylavery/shared/textField.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _promoTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _telephoneTextController = TextEditingController();

  TextEditingController _password2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("000"),
              hexStringToColor("000"),
              hexStringToColor("4895EF"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Entrer votre nom ",
                          Icons.person_outline,
                          false,
                          _nameTextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Entrer votre prenom ",
                          Icons.person_outline,
                          false,
                          _userNameTextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Entrer votre Email",
                          Icons.person_outline,
                          false,
                          _emailTextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Entrer votre mot de passe",
                          Icons.person_outline,
                          false,
                          _passwordTextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Retaper votre mot de passe",
                          Icons.person_outline,
                          false,
                          _password2TextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Entrer votre numéro de promo ",
                          Icons.person_outline,
                          false,
                          _promoTextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Entrer votre numéro de téléphone",
                          Icons.person_outline,
                          false,
                          _telephoneTextController,
                          Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      signInSignUpButton("S'inscrire", context, false, () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) async {
                          FirebaseFirestore.instance
                              .collection('USERS')
                              .doc(FirebaseAuth.instance.currentUser!.uid
                                  .toString())
                              .set({
                            'email': _emailTextController.value.text,
                            'promo': _promoTextController.value.text,
                            'nom': _nameTextController.value.text,
                            'prenom': _userNameTextController.value.text,
                            'telephone': _telephoneTextController.value.text,
                            'admin': false,
                            "id": FirebaseAuth.instance.currentUser!.uid
                                .toString()
                          });
                          final Future<SharedPreferences> _infosUserShared =
                              SharedPreferences.getInstance();
                          SharedPreferences infosUserShared =
                              await _infosUserShared;
                          infosUserShared.setString(
                              "password", _passwordTextController.value.text);
                          infosUserShared.setString(
                              "email", _emailTextController.value.text);
                          infosUserShared.setString(
                              "prenom", _userNameTextController.value.text);
                          infosUserShared.setString(
                              "nom", _nameTextController.value.text);
                          infosUserShared.setString(
                              "promo", _promoTextController.value.text);
                          infosUserShared.setString(
                              "telephone", _telephoneTextController.value.text);
                              infosUserShared.setString(
                              "userId",FirebaseAuth.instance.currentUser!.uid);
                          print("account creating success");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Accueil()));
                        }).onError((error, stackTrace) {
                          print("Error" + error.toString());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("ERREUR >>${error.toString()}")));
                        });
                      }),
                    ])))));
  }
}
