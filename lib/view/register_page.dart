import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/view/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalanapp/auth/email_signin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

// TODO: Guardar la imformacion en la base de datos de firestore
  //TODO: añadir las alertas bien ejemplo (se registro correctamente, fallos de registro, etc..)
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    //variables que se almacena
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cofirmPasswordController = TextEditingController();
    TextEditingController NameController = TextEditingController();
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
                    height:8,
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
                    height: 200,
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
                      height: height / 1.7,
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
                          //Nombre
                          SizedBox(
                            height: 42,
                            child: TextField(
                              controller: NameController,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: 'Nombre',
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 20, 15, 25),
                                suffixIcon: const Icon(Icons.perm_identity),
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
                          //phone
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                            height: 42,
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: 'Teléfono',
                                contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 15, 25),
                                suffixIcon: const Icon(Icons.phone),
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
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            height: 42,
                            child: TextField(
                              controller: cofirmPasswordController,
                              textAlign: TextAlign.left,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Confirmar Contraseña',
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
                          const SizedBox(
                            height: 30,
                          ),
                          //Boton de registro:
                          MaterialButton(
                            onPressed: () async {
                              //accion cuando se preciona el boton

                              String password = passwordController.text;
                              String email = emailController.text;
                              String veripassword = cofirmPasswordController.text;
                              String name = NameController.text;
                              //verifica si es la misma contraseña
                              if(password == veripassword){
                                    try{
                                      await Auth().registerWithEmailAndPassword(email, password);
                                    }catch(e){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: Text(e.toString()),
                                              actions: [
                                                  TextButton(
                                                      onPressed:(){
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('Aceptar'))
                                              ],
                                            );
                                          }
                                          );
                                    }

                              }else{
                                      showDialog(
                                      context: context,
                                      builder: (BuildContext context)
                                      {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(' credenciales no identicas'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Aceptar'))
                                          ],
                                        );
                                      }
                                      );


                              }
                            },
                            color: ColorConstants.jazPalette1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                            ),
                            height: 40,
                            child: const Text(
                              ' Regístrarse',
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
                      onTap: ()=> Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginPage(),
                        ),
                      ),
                      child:  Text(
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
