import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
}
