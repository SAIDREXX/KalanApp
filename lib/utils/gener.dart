import 'package:flutter/material.dart';

final List<String> geners = [
  'Hombre',
  'Mujer',
  'Nigga',
  'Otro',
  'Licuadora Philips',
  '¿?'
];

class GenderDropdownButton extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;

  const GenderDropdownButton(
      {required this.value, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 0.5),
      ),
      child: PopupMenuButton<String>(
        initialValue: value,
        onSelected: onChanged,
        itemBuilder: (BuildContext context) {
          return geners.map((String gender) {
            return PopupMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value ?? 'Seleccione un género'),
            const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
      ),
    );
  }
}
