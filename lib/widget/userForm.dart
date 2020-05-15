import 'package:e_learning/models/constant.dart';
import 'package:e_learning/models/user.dart';
import 'package:e_learning/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final _key = GlobalKey<FormState>();

    String email, prenoms;

    return StreamBuilder(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
            key: _key,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    prenoms = val;
                  },
                  onSaved: (val) {
                    prenoms = val;
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Veuillez saisir un prénom valide' : null,
                  decoration: InputDecoration(labelText: 'Prénoms'),
                  initialValue: userData.prenoms ?? '',
                ),
                TextFormField(
                  onSaved: (val) {
                    email = val;
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Veuillez saisir un Email valide' : null,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(labelText: 'Email'),
                  initialValue: userData.email ?? '',
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_key.currentState.validate()) {
                      _key.currentState.save();
                      dynamic result = await DatabaseService(uid: user.uid)
                          .updateUserDataOrCreate(prenoms, email);

                      if (result == null) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                    'Modifications effectués avec succès !'),
                                actions: <Widget>[
                                  FlatButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: Text('Quitter'))
                                ],
                              );
                            });
                      }
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey,
                    ),
                    child: Center(
                        child: Text(
                      'Modifier',
                      style: connexionButton,
                    )),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}