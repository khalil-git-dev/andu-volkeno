
import 'package:e_learning/models/resources.dart';
import 'package:e_learning/widget/videoPlay.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class DetailsCours extends StatefulWidget {
  final String nom;
  final List<Video> videos;
  final List<Document> documents;

  DetailsCours({
    this.nom,
    this.videos,
    this.documents,
  });
  @override
  _DetailsCoursState createState() => _DetailsCoursState();
}

class _DetailsCoursState extends State<DetailsCours> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          iconTheme: new IconThemeData(color: '#18D09D'.toColor()),
          title: Text(
            widget.nom,
            style: TextStyle(color: '#18D09D'.toColor()),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(0.0),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.grey,
                  ),
                  label: Text(''),
                )),
          ],
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'Documents',
                style: TextStyle(color: '#18D09D'.toColor()),
              ),
            ),
            Tab(
              child: Text(
                'Vidéo',
                style: TextStyle(color: '#18D09D'.toColor()),
              ),
            ),
            Tab(
              child: Text(
                'Téléchargements',
                maxLines: 1,
                style: TextStyle(color: '#18D09D'.toColor()),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          Center(
              child: ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    Document document = widget.documents[index];
                    return Card(
                      child: Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 80,
                          child: ListTile(
                            leading: IconButton(
                                icon: (document.favoris == 0)
                                    ? FaIcon(Icons.favorite_border)
                                    : FaIcon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    document.favoris =
                                        (document.favoris == 0) ? 1 : 0;
                                  });
                                }),
                            trailing: FaIcon(FontAwesomeIcons.download),
                            title: Text(
                              '${document.nom}',
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Taille : ${document.taille} Mo'),
                                Text("\t-\tType : pdf")
                              ],
                            ),
                          )),
                    );
                  })),
          Center(
            child: VideoPlay(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(FontAwesomeIcons.fileDownload, size: 50, color: '#18D09D'.toColor()),
                SizedBox(height: 20,),
                Text(
                  'Le centre de téléchargement est vide.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: '#18D09D'.toColor(),
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chalkboardTeacher),
              title: Text('Semestre'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              title: Text('Favoris'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.folder),
              title: Text('Support'),
            ),
          ],
          currentIndex: 2,
        ),
      ),
      length: 3,
    );
  }
}
