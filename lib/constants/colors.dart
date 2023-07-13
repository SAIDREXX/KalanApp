import 'package:flutter/material.dart';

class ColorConstants {
  static Color starterWhite = hexToColor('#DADADA');
  static Color paletteColor1 = hexToColor('#020726');
  static Color paletteColor2 = hexToColor('#024959');
  static Color paletteColor3 = hexToColor('#03A6A6');
  static Color paletteColor4 = hexToColor('#F2CFBB');
  static Color paletteColor5 = hexToColor('#D98471');
  static Color verdeGuapo = hexToColor('#3DE372');
  //Color Palette By Jaz
  static Color jazPalette1 = hexToColor('#276E90');
  static Color jazPalette2 = hexToColor('#CECFC9');
  static Color jazPalette3 = hexToColor('#0A3143');
  static Color jazPalette4 = hexToColor('#EFEFEF');
  static Color jazPalette5 = hexToColor('#212121');
  //Colorcitos Guapos By SAIDREXXX
  static Color saidInactive = hexToColor('#ED435E'); //Rojito Guapo
  static Color saidActive = hexToColor('#2AB51D'); //Verde Cuqui
  static Color saidPalette1 = hexToColor('#25313F'); //Gris Chulo
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
