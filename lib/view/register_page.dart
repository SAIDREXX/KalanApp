
import 'package:flutter/material.dart';
import 'package:kalanapp/auth/email_signin.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/firebase_options.dart';
import 'package:kalanapp/utils/gener.dart';
import 'package:kalanapp/view/login_page.dart';
import 'package:kalanapp/utils/month.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
//variables
  TextEditingController NameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController DiaController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PaswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneLadaController = TextEditingController();
  TextEditingController SexController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _selectedCountryCode = "+52";
  String _selectorGender = 'Sexo';
  String _selectedMonth = 'Enero';

  String combinePhoneNumberWithLada(String phoneNumber) {
    String lada = _selectedCountryCode;
    return '$lada$phoneNumber';
  }


  @override
  void dispose() {
    _monthController.dispose();
    super.dispose();
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
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: SingleChildScrollView(
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
                            controller: NameController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 15, 25),
                              prefixIcon: const Icon(Icons.perm_identity),
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
                            controller: lastNameController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: 'Apellidos',
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 15, 25),
                              prefixIcon: const Icon(Icons.badge_outlined),
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
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 42,
                                child: TextField(
                                  controller: DiaController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')), // Permite solo números enteros
                                  ],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'Dia',
                                    contentPadding: const EdgeInsets.all(15),
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
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 42,
                                  child: MonthDropdownButton(
                                      value: _selectedMonth,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedMonth = newValue ?? 'Enero';
                                          _monthController.text =_selectedMonth;
                                        },);
                                      }),
                                ),
                              ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 42,
                                child: TextField(
                                  controller: yearController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')), // Permite solo números enteros
                                  ],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'Año',
                                    contentPadding: const EdgeInsets.all(15),
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
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          height: 42,
                          child: GenderDropdownButton(

                              value: _selectorGender,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectorGender = newValue?? 'Sexo';
                                  SexController.text = _selectorGender;
                                });
                              }),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          height: 42,
                          child: TextField(
                            controller: EmailController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: 'Correo Electrónico',
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 15, 25),
                              prefixIcon: const Icon(Icons.email_outlined),
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
                            controller: PaswordController,
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
                            height: 45,
                            child: TextField(
                              controller: phoneController,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Teléfono',
                                contentPadding: const EdgeInsets.fromLTRB(20, 20, 15, 25),
                                //bandera y el numero de cada pais
                                prefixIcon: CountryCodePicker(
                                  initialSelection: 'MX',
                                  showCountryOnly: true,
                                  showOnlyCountryWhenClosed: false,
                                  favorite: ['+1', 'US'],
                                  onChanged: (CountryCode? countryCode) {
                                    // Aquí puedes realizar alguna acción cuando cambie el código de país seleccionado.
                                    setState(() {
                                      _selectedCountryCode = countryCode?.dialCode ?? "+52";
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorConstants.jazPalette1),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              onChanged: (value){
                               String phoneNumber = value;
                                String PhoneNumberlada = combinePhoneNumberWithLada(phoneNumber);


                              },
                            ),
                          ),
                        const SizedBox(
                          height: 18,
                        ),
                        //Boton de Registro
                        MaterialButton(
                          onPressed: () async {

                            String password = PaswordController.text;
                            String Name = NameController.text;
                            String lastName = lastNameController.text;
                            String DiaText = DiaController.text;
                            //Obtiene un valor y lo convierte de string a entero si es una caracter se convierte en 0
                            int Dia = int.tryParse(DiaText) ?? 0;
                            String Mes = _monthController.text;
                            String yearText = yearController.text;
                            double year = double.tryParse(yearText) ?? 0;
                            String phoneText = phoneController.text;
                            double phone = double.tryParse(phoneText) ?? 0;
                            String email = EmailController.text;
                            String Sex = SexController.text;
                            String phoneNumber = phoneController.text;
                            String phoneLada = combinePhoneNumberWithLada(phoneNumber);
                            try {
                              await Auth().registerWithEmailAndPassword(
                                  email, password);
                              await addUsuarios(
                                  Name,
                                  lastName,
                                  Dia,
                                  Mes,
                                  year,
                                  Sex,
                                  phone,
                                  phoneLada,
                                  email,
                                  password);
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
                          },
                          color: ColorConstants.jazPalette1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31),
                          ),
                          height: 38,
                          child: const Text(
                            'Registrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿Ya tienes una cuenta?',
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
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: Text(
                        '¡Inicia Sesión!',
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
            ),
          ],
        ),
      ),
    );
  }
}