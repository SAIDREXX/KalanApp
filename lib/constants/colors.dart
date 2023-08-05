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
  static Color jazPalette6 = hexToColor('#1E4254');
  static Color jazPalette7 = hexToColor('#97A19E');
  static Color jazPalette8 = hexToColor('#356B85');
  static Color jazPalette9 = hexToColor('#4A4A4A');
  static Color jazPalette10 = hexToColor('#022E4F');
  //Colorcitos Guapos By SAIDREXXX
  static Color saidInactive = hexToColor('#ED435E'); //Rojito Guapo
  static Color saidActive = hexToColor('#2AB51D'); //Verde Cuqui
  static Color saidPalette1 = hexToColor('#25313F'); //Gris Chulo
  //Grises Interesantes
  static Color greyScale1 = hexToColor('#8C8C8C');
  static Color greyScale2 = hexToColor('#4D4D4D');
  static Color greyScale3 = hexToColor('#333333');
  static Color greyScale4 = hexToColor('#BFBFBF');
  static Color greyScale5 = hexToColor('#808080');
  static Color greyScale6 = hexToColor('#404040');
  static Color greyScale7 = hexToColor('#E6E6E6');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
