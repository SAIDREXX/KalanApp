import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:kalanapp/auth/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home_screen.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool _obscureText = true;

  Future<void> signInWithGoogle(BuildContext context) async {
    final UserCredential? userCredential =
        await GoogleAuthService().signInWithGoogle();

    if (userCredential != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.jazPalette2,
      body: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstants.jazPalette3,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/kalan_logo_full.png'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Conecta, Protege y Comparte con Kalan',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: height / 1.9,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                            height: 42,
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: 'Correo Electrónico',
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 20, 15, 25),
                                suffixIcon: const Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstants.jazPalette1),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            height: 42,
                            child: TextField(
                              textAlign: TextAlign.left,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 20, 15, 25),
                                suffixIcon: IconTheme(
                                  data: IconThemeData(
                                    color: _obscureText
                                        ? ColorConstants.saidInactive
                                        : ColorConstants.saidActive,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstants.jazPalette1),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ),
                          ),
                          SwitchListTile.adaptive(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              'Recuérdame',
                              style: TextStyle(
                                color: ColorConstants.jazPalette3,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            activeColor: ColorConstants.jazPalette3,
                            inactiveTrackColor: ColorConstants.jazPalette2,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: ColorConstants.jazPalette1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                            ),
                            height: 38,
                            child: const Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorConstants.starterWhite,
                              )),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'O',
                                style: TextStyle(
                                    color: ColorConstants.starterWhite,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorConstants.starterWhite,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Image.asset('assets/apple.png'),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                height: 30,
                                child: Image.asset('assets/facebook.png'),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () => signInWithGoogle(context),
                                child: SizedBox(
                                  height: 30,
                                  child: Image.asset('assets/google.png'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            'Olvidé mi contraseña',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.jazPalette3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('¿Aún no tienes una cuenta?',
                            style: TextStyle(
                                color: ColorConstants.jazPalette5,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          ),
                          child: Text(
                            '¡Regístrate!',
                            style: TextStyle(
                                color: ColorConstants.jazPalette1,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    super.key,
    required String this.hint,
    required IconData this.icon,
  });

  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: hint,
          labelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(color: ColorConstants.starterWhite)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(color: ColorConstants.paletteColor3)),
          suffixIcon: Icon(icon)),
    );
  }
}
