import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/main_menu.dart';
import 'package:kalanapp/view/forgot_password.dart';
import '../constants/colors.dart';
import 'package:kalanapp/auth/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_page.dart';
import 'package:kalanapp/auth/email_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cool_alert/cool_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedValues();
  }
//Funciones

  //funcion de cargar los datos guardados
  Future<void> _loadSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

//funcion para guardar los datos
  Future<void> _saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
      await prefs.setBool('rememberMe', rememberMe);
    } else {
      // Si el switch está deshabilitado, borramos los datos almacenados
      await prefs.remove('name');
      await prefs.remove('email');
      await prefs.remove('password');
      await prefs.setBool('rememberMe', rememberMe);
    }
  }
//funicon para iniciar sesion con google

  Future<void> signInWithGoogle(BuildContext context) async {
    final UserCredential? userCredential =
        await GoogleAuthService().signInWithGoogle();
    final User? user = userCredential!.user;
    String userId = user!.uid;
    String? userName = user.displayName;
    String? userPhotoURL = user.photoURL;
    String userGroupIdentifier = userId.substring(0, 6);

    await FirebaseFirestore.instance
        .collection('groups')
        .doc(userGroupIdentifier)
        .set({
      'creator': userId,
      'members': [userId],
      'membersInfo': {
        userId: {
          'name': userName,
          'pictureURL': userPhotoURL,
        },
      },
    });
    if (userCredential != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainMenu(),
        ),
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
                image: const DecorationImage(
                  image: AssetImage('assets/MayanBackground5.png'),
                  fit: BoxFit.cover,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height / 1.9,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
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
                                controller: emailController,
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
                                controller: passwordController,
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
                                  _saveValues(); //se llama la funcion de guardar los datos y se cargan
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
                                onPressed: () async {
                                  try {
                                    String email = emailController
                                        .text; // Obtener el valor del campo de texto
                                    String password = passwordController
                                        .text; // Obtener el valor del campo de contraseña

                                    //verificacion del auteticacion
                                    await Auth().singInWithEmailAndPassword(
                                        email: email, password: password);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainMenu(),
                                      ),
                                    );
                                  } catch (e) {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      title: 'Oops...',
                                      text: e.toString(),
                                      backgroundColor:
                                          ColorConstants.jazPalette3,
                                      confirmBtnColor:
                                          ColorConstants.jazPalette1,
                                      loopAnimation: false,
                                    );
                                  }
                                },
                                color: ColorConstants.jazPalette1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                height: 38,
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/MayanBackground5.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Iniciar Sesión',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
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
                            // dirige a la pagina de restablecimiento de contraseña
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushReplacement(
                                //Cambiar a ForgotPage() después De Settings
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPage(),
                                ),
                              ),
                              child: Text(
                                'Olvidé mi contraseña',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.jazPalette3,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
                          const SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: ColorConstants.starterWhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: ColorConstants.paletteColor3),
        ),
        suffixIcon: Icon(icon),
      ),
    );
  }
}
