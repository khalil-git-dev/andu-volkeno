import 'package:e_learning/services/firebase.dart';
import 'package:e_learning/tempon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Andu',
        theme: ThemeData(        
          primarySwatch: Colors.green,
        ),
        home: Tempon(),
      ), value: FirebaseService().user,
    );
}

}
