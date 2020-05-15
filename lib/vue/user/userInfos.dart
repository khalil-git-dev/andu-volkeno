import 'package:e_learning/widget/userForm.dart';
import 'package:e_learning/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
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

class _UserInfoState extends State<UserInfo> {
  FirebaseService firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        iconTheme: new IconThemeData(color: '#18D09D'.toColor()),
        title: Image.asset("assets/images/logo.jpeg"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: FlatButton.icon(
              onPressed: () {
                // await firebaseService.signOut();
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 120,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            UserInfo()));
                              },
                              child: Row(
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.edit),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Modifier mes informations personnelles',
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () async {
                                Navigator.pop(context);
                                await firebaseService.deconnexion();
                              },
                              child: Row(
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.signOutAlt),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Déconnexion',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(
                FontAwesomeIcons.userTie,
                color: Colors.grey,
                size: 26,
              ),
              label: Text(''),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 100),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Mes Informations",
                  style: TextStyle(
                      color: '#18D09D'.toColor(),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage('assets/images/1.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                UserForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
