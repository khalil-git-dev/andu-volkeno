
import 'package:e_learning/models/constant.dart';
import 'package:e_learning/services/firebase.dart';
import 'package:e_learning/vue/authentification/inscrir.dart';
import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class _ConnexionState extends State<Connexion> {
  var _key = GlobalKey<FormState>();
  FirebaseService firebaseService = FirebaseService();
  String email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Image.asset("assets/images/logo.jpeg"),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Connectez-vous",
                        style: TextStyle(
                          color: '#18D09D'.toColor(),
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        onChanged: (val) => email = val,
                        validator: (val) =>
                            val.isEmpty ? 'Veuilez saisir votre E-mail' : null,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            textfield.copyWith(hintText: 'Adresse mail'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        onChanged: (val) => password = val,
                        validator: (val) => val.isEmpty
                            ? 'Veuilez saisir votre mot de passe'
                            : null,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration:
                            textfield.copyWith(hintText: 'Mot de passe'),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Mot de passe oublié ?",
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_key.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            dynamic result = await firebaseService
                                .connexionEmailPasswor(email, password);
                            if (result == null) {
                              setState(() {
                                isLoading = false;
                              });
                              print('echec');
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: '#18D09D'.toColor(),
                          ),
                          child: Center(
                              child: Text(
                            'Se connecter',
                            style: connexionButton,
                          )),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Pas encore de compte ?"),
                          GestureDetector(
                            onTap: () {
                              // remplacement de l'ecran par la page d'inscription
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return Inscription();
                              }));
                            },
                            child: Text(
                              "\tS'inscrire",
                              style: TextStyle(
                                fontSize: 16,
                                color: '#18D09D'.toColor(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
