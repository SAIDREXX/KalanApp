import 'package:flutter/material.dart';
import 'package:kalanapp/main_menu.dart';
import 'dart:async';
import '/view/get_started_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkLogin();
    Timer(const Duration(seconds: 3), () {
      _navigateToNextScreen();
    });
  }

  Future<void> _checkLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _isFirstTime = false;
      });
    } else {
      setState(() {
        _isFirstTime = true;
      });
    }
  }

  void _navigateToNextScreen() {
    if (_isFirstTime) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const GetStartedPage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainMenu()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/SplashScreen.gif',
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
