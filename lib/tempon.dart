
import 'package:e_learning/vue/acceuil.dart';
import 'package:e_learning/vue/authentification/connexion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Tempon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // test si un user est connecté
    final user = Provider.of<User>(context);

    if (user == null) {
      return Connexion(); 
    } else {
      return Acceuil();
    }
  }
}