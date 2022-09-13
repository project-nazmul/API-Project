import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(double size, Color? clr, [FontWeight? fw]) {
  return GoogleFonts.roboto(fontSize: size, color: clr, fontWeight: fw);
}

String baseUrl = "https://apihomechef.antopolis.xyz/";

showInToast(String title) {
  return Fluttertoast.showToast(
      msg: "$title",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
