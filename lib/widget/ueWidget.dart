import 'package:e_learning/models/resources.dart';
import 'package:e_learning/vue/cours/detailsCours.dart';
import 'package:flutter/material.dart';

class UeWidget extends StatelessWidget {
  final Color color;
  final String nom;
  final Icon icon;
  final Image image;
  final int index;
  final List<Video> videos;
  final List<Document> documents;

  UeWidget({
    this.nom,
    this.image,
    this.icon,
    this.color,
    this.index,
    this.documents,
    this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DetailsCours(
                      nom: this.nom,
                      documents: this.documents,
                      videos: this.videos,
                )
            ));
            //print(nom);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          margin: (index % 2) == 0
              ? EdgeInsets.only(right: 15)
              : EdgeInsets.only(right: 5),
          // width: 50,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(
                height: 20,
              ),
              Text(
                nom,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
