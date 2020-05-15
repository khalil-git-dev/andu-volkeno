import 'package:e_learning/models/resources.dart';
import 'package:e_learning/models/ue.dart';
import 'package:e_learning/models/user.dart';
import 'package:e_learning/services/database.dart';
import 'package:e_learning/services/firebase.dart';
import 'package:e_learning/vue/user/userInfos.dart';
import 'package:e_learning/widget/ueWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Acceuil extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  
  FirebaseService firebaseService = FirebaseService();

  List<UniteEnseignement> ue = [
    UniteEnseignement(
        // image: Image(image: AssetImage('assets/images/pc.jpeg'),
        //     width: 300,
        //     height: 300,
            
        //   ),
        icon: Icon(
          FontAwesomeIcons.globeAfrica,
          color: Colors.white,
          size: 72,
        ),
        nom: 'HISTO-GEO',
        color: '#18D09D'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        
        icon: Icon(
          FontAwesomeIcons.flask,
          color: Colors.white,
          size: 72,
        ),
        nom: 'PC',
        color: '##EE9F70'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          FontAwesomeIcons.calendarAlt,
          color: Colors.white,
          size: 72,
        ),
        nom: 'MATHS',
        color: '#83E2EC'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          FontAwesomeIcons.microscope,
          color: Colors.white,
          size: 72,
        ),
        nom: 'SVT',
        color: '##F3DD3E'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          Icons.work,
          color: Colors.white,
          size: 72,
        ),
        nom: 'SVT',
        color: Colors.blue[300],
        documents: documents,
        videos: videos),
    UniteEnseignement(
      icon: Icon(
        Icons.work,
        color: Colors.white,
        size: 72,
      ),
      nom: 'SVT',
      color: Colors.green,
      documents: documents,
      videos: videos,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // test si un user est connecté
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           UserData userData = snapshot.data;
          return Scaffold(
            drawerScrimColor: Colors.grey[200],
            drawer: Drawer(
                child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: '#18D09D'.toColor()),
                  accountName: Text("${userData.prenoms}"),
                  accountEmail: Text("${userData.email}"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profil.jpg"),
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.chalkboardTeacher),
                  title: Text('Mes cours'),
                  trailing: Chip(label: Text('${ue.length}')),
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.grey,),
                  title: Text('Mes cours Favoris'),
                  trailing: Chip(label: Text('4')),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.download),
                  title: Text('Mes Téléchargements'),
                  trailing: Chip(label: Text('0')),
                ),
                 
                Spacer(),
                Divider(),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> UserInfo()));
                  },
                  leading: FaIcon(FontAwesomeIcons.userAlt, color: Colors.black,),
                  title: Text('Mes Informations'),
                ),
                ListTile(
                  onTap: () async{
                    await firebaseService.deconnexion();
                  },
                  leading: FaIcon(FontAwesomeIcons.signOutAlt, color: Colors.black,),
                  title: Text('Déconnexion'),
                )
              ],
            )),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
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
                                            style: TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon( // icon de deconnexion 
                        FontAwesomeIcons.userAlt, 
                        color: Colors.grey,
                        size: 26,
                      ),
                      label: Text(''),
                    )),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 50),
                  child: Text(
                    'Nos unités d\'enseignements',
                    style: TextStyle(
                        fontSize: 20,
                        color: '#18D09D'.toColor(),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: ue.length,
                    itemBuilder: (BuildContext context, int index) {
                      UniteEnseignement uniteEnseignement = ue[index];
                      return UeWidget(
                        image: uniteEnseignement.image,
                        nom: uniteEnseignement.nom,
                        icon: uniteEnseignement.icon,
                        color: uniteEnseignement.color,
                        index: index,
                        documents: uniteEnseignement.documents,
                        videos: uniteEnseignement.videos,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: '#18D09D'.toColor(),
                elevation: 10,
                items: [
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.chalkboardTeacher),
                    title: Text('Semestre 1'),
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.chalkboardTeacher),
                    title: Text('Semestre 2'),
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.folder),
                    title: Text('Supports'),
                  ),
                ]),
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