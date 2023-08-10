import 'package:flutter/material.dart';
import 'package:kalanapp/main_menu.dart';
import '../constants/colors.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/get_started_video.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/kalan_logo_full.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur',
                    style: TextStyle(
                        color: ColorConstants.starterWhite,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  MaterialButton(
                    color: ColorConstants.jazPalette1,
                    height: 58,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31)),
                    onPressed: () async {
                      final user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MainMenu()));
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      }
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
