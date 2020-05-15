class Video {
  final String titre;
  final double taille;
  int favoris;

  Video({this.titre, this.taille, this.favoris = 0});
}

class Document {
  final String nom;
  int favoris;
  final double taille;

  Document({this.nom, this.favoris = 0, this.taille});
}

final List<Document> documents = [
  Document(nom: 'La factorisation', taille: 11.5),
  Document(nom: 'La factorisation', taille: 11.5),
];
final List<Video> videos = [
  Video(titre: 'La factorisation', taille: 2.4),
  Video(titre: 'La factorisation', taille: 2.4),
];
