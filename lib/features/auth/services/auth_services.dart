import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user';
      } else {
        throw e.message!;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if(user!= null) {
        await user.updateDisplayName(name);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;
      }

      return user;
    }
      on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw('The account already exists for that email');
      } else {
        throw(e.toString());
      }
    } catch (e) {
      throw(e.toString());
    }
  }

  Future<User?> checkUserLoggedIn() async {
    User? user = _firebaseAuth.currentUser;

    return user;
  }
}
