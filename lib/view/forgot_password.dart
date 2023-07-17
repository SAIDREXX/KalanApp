import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/view/login_page.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  ForgotPageState createState() => ForgotPageState();
}

class ForgotPageState extends State<ForgotPage> {
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
                    height: 8,
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
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height / 3.3,
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
                            'Restablecimiento de contraseña',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          //Correo
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
                            height: 25,
                          ),
                          //Boton de registro:
                          MaterialButton(
                            onPressed: () {},
                            color: ColorConstants.jazPalette1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                            ),
                            height: 40,
                            child: const Text(
                              ' Restablecer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: Text(
                        '¿Ya tienes una cuenta? Inicia Sesion',
                        style: TextStyle(
                          color: ColorConstants.jazPalette1,
                          fontWeight: FontWeight.w700,
                        ),
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
