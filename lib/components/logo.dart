import 'package:flutter/material.dart';

/*
      *@ logo assets
 */
Image logoImage({required double height, required double width}) {
  return Image.asset(
    'assets/images/logo.png',
    height: height,
    width: width,
  );
}
