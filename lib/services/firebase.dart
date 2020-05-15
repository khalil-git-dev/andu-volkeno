import 'package:e_learning/services/database.dart';
import 'package:e_learning/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // authentification change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // Conversion firebaseUser en un model User
  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  // Creation de compte pour les users
  Future inscriptionUser(String email, String password, String prenoms) async {
    try {
      // CREATION 
      AuthResult _result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = _result.user;

      // MIS A JOURS
      await DatabaseService(uid: firebaseUser.uid).updateUserDataOrCreate(prenoms, email);
      return _userFromFirebaseUser(firebaseUser);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Connexion avec email & password
  Future connexionEmailPasswor(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // méthode de déconnexionn User
  Future deconnexion() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
