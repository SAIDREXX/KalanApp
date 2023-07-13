import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;

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
                            'Regístrate',
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
                        ],
                      ),
                    )
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
