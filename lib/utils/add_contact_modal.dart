import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class ContactsModal extends StatefulWidget {
  const ContactsModal({super.key});

  @override
  State<ContactsModal> createState() => _ContactsModalState();
}

class _ContactsModalState extends State<ContactsModal> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width / 1.1,
        height: height / 3,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.jazPalette4,
          borderRadius: BorderRadius.circular(32),
          image: const DecorationImage(
              image: AssetImage('assets/MayanBackground5.png'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Agregar Contacto',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: width / 1.4,
                height: 42,
                child: TextField(
                  controller: nameController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'Nombre de Contacto',
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 15, 25),
                    suffixIcon: const Icon(Icons.person_outline_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.jazPalette1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: width / 1.4,
                height: 42,
                child: TextField(
                  controller: phoneController,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Numero Telefonico',
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 15, 25),
                    suffixIcon: const Icon(Icons.phone_android_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.jazPalette1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              MaterialButton(
                onPressed: () {
                  String name = nameController.text;
                  String phoneNumber = phoneController.text;
                },
                color: ColorConstants.jazPalette3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: const BorderSide(color: Colors.white, width: 1.5),
                ),
                height: 40,
                child: const Text(
                  'Confirmar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
