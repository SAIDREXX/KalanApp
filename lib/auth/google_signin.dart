import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Autenticación exitosa, mostrar mensaje de éxito en la consola
      print('Inicio de sesión exitoso: ${userCredential.user!.displayName}');
      return userCredential;
    } catch (error) {
      // Ocurrió un error durante la autenticación, mostrar mensaje de error en la consola
      print('Error durante el inicio de sesión con Google: $error');
      return null;
    }
  }

  Future<void> signOutWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      print('No fue posible cerrar la sesión');
    }
  }
}
