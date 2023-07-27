import 'package:flutter/material.dart';

final List<String> meses = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre'
];

class MonthDropdownButton extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;

  const MonthDropdownButton(
      {required this.value, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 0.5),
      ),
      child: PopupMenuButton<String>(
        initialValue: value,
        onSelected: onChanged,
        itemBuilder: (BuildContext context) {
          return meses.map((String mes) {
            return PopupMenuItem<String>(
              value: mes,
              child: Text(mes),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value ?? 'Seleccione un mes'),
            const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
      ),
    );
  }
}
