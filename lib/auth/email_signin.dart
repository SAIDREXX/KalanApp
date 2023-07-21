import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> singInWithEmailAndPassword({
    required String email,
    required String password,

  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Registro de usuario con correo electrónico y contraseña
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw e;
    }
  }

  //Restablecimiento de contraseña

  Future<void>resetpassword(String email) async{
      try{
        await _firebaseAuth.sendPasswordResetEmail(email: email);

      }catch(e){
          throw e;
      }
  }

  //TODO: solucionar el problema que no se guarda en base de datos
  Future<void> saveData(
      BuildContext context,
      String name, String email, String password) async {
    try {
      await _firestore.collection('usuarios').add({
        'nombre': name,
        'correo': email,
        'contraseña': password,
      });
      // Datos guardados correctamente
    } catch (e) {
      // Manejo de errores durante la escritura en Firestore
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error al guardar los datos en Firebase'),
            actions: [
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}


