import 'package:flutter/material.dart';
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double screenBottom;

  static bool isLandScape;
  static bool isTab;
  
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    screenBottom=_mediaQueryData.viewInsets.bottom;
    isLandScape=_mediaQueryData.orientation==Orientation.landscape ? true:false;
    isTab=_mediaQueryData.size.aspectRatio >= 0.74 && _mediaQueryData.size.aspectRatio < 1.5 ? true :false;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

InputDecoration inputDecoration =InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.blueGrey)
  ) ,
  labelStyle: TextStyle(color: Colors.blueAccent,fontSize: 20),
  focusColor:Colors.blue[100] 
);
ShapeBorder roundedShapeBorder = RoundedRectangleBorder(borderRadius:BorderRadius.circular(15) );
const Color primaryColor =Color(0xff516091);