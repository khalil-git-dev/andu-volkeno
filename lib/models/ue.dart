import 'package:e_learning/models/resources.dart';
import 'package:flutter/material.dart';

class UniteEnseignement {
  final String nom;
  final Icon icon;
  final Image image;
  final Color color;
  final List<Video> videos;
  final List<Document> documents;

  UniteEnseignement({
    this.icon,
    this.image,
    this.nom,
    this.color,
    this.videos,
    this.documents, AssetImage backgroundImage
  });
}