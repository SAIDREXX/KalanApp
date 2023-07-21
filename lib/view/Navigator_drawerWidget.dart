import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
class NavigatorDrawerWidget extends StatelessWidget{
  final paddig = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Material(
        color: ColorConstants.paletteColor2,
        child: ListView(
          children: <Widget>
          [
            const SizedBox(height: 48),
          buildMenuItem(
              text: 'People',
            icon: Icons.people

          ),
          ],
        ),
      )
    );

  }
}


Widget buildMenuItem({
  required String text,
  required IconData icon,
}){
  final color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text,style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: (){},
  );
}