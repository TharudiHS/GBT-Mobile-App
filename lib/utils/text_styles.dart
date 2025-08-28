import 'package:flutter/material.dart';
import 'app_colours.dart';

class TextStyles {
  static const TextStyle size24WeightBoldCormorantGaramondBold = TextStyle(
    fontFamily: 'CormorantGaramond-Bold',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColours.white,
    height: 29 / 24,
    letterSpacing: 0,
  );
  static const TextStyle size24WeightBoldCormorantGaramondBoldblack = TextStyle(
    fontFamily: 'CormorantGaramond-Bold',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColours.black,
  );
  static const TextStyle size12TTCommonsItalic = TextStyle(
    fontFamily: 'TT Commons Italic',
    color: AppColours.greyB5,
    fontSize: 12,
  );
  static const TextStyle size14WeightBoldTTCommonsRegular = TextStyle(
    fontFamily: 'TT Commons Regular',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColours.black,
  );
  static const TextStyle size17WeightBoldTTCommonsRegular = TextStyle(
    fontFamily: 'TT Commons Regular',
    color: AppColours.white,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );
}
