import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static Future<void> signIn(
      {required String email,
      required String password,
      required Function(UserCredential userCredential) onSuccess,
      required Function onFailure}) async {
    try {
      onSuccess(await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password));
    } catch (e) {
      onFailure();
    }
  }
}
