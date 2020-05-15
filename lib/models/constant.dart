import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TextStyle titre_app = TextStyle(
//   fonts
// )

TextStyle titreApp = GoogleFonts.lato(fontSize: 32, color: Colors.green);
TextStyle connexionButton = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.bold
);

InputDecoration textfield = InputDecoration(
  filled: true,
  fillColor: Color(0x1DDC98),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.grey),
  ),
);


