import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polylavery/login/signUp.dart';
import 'package:polylavery/screen/accueil.dart';
import 'package:polylavery/shared/textField.dart';
import 'package:polylavery/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailTextController = TextEditingController();
  late TextEditingController _passwordTextController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myMethode();
  }

  Future<void> myMethode() async {
    final Future<SharedPreferences> _infosUserShared =
        SharedPreferences.getInstance();
    final SharedPreferences prefs = await _infosUserShared;
    if (prefs.getString("password")!.isNotEmpty &&
        prefs.getString("email")!.isNotEmpty) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: prefs.getString("email")!,
              password: prefs.getString("password")!)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Accueil()));
      });
    }
  }

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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/logo_jep2.png",
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width * 0.6,
              height: 240,

              // color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          reusableTextField("Enter Mail", Icons.person_outline, false,
              _emailTextController, Colors.white),
          SizedBox(
            height: 30,
          ),
          reusableTextField("Enter Password", Icons.lock, true,
              _passwordTextController, Colors.white),
          signInSignUpButton("Se Connecter", context, true, () async {
            // final Future<SharedPreferences> _infosUserShared =
            //     SharedPreferences.getInstance();
            // final SharedPreferences prefs = await _infosUserShared;
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                .then((value) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Accueil()));
            });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Je n'ai pas de compte ",
                style: TextStyle(color: Colors.white70),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ]),
      )),
    ));
  }
}
