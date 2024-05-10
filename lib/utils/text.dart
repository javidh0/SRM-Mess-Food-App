import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTextPrimiary = GoogleFonts.poppins().copyWith(
  color: Colors.white,
);

TextStyle kTextPrimiaryBig = kTextPrimiary.copyWith(
  fontSize: 35,
  fontWeight: FontWeight.bold,
);
TextStyle kTextPrimiarySmall = kTextPrimiary.copyWith(fontSize: 15);

TextStyle kTextSecondary = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);

TextStyle kTextSecondaryBig = kTextSecondary.copyWith(
  fontSize: 20,
);
TextStyle kTextSecondarySmall = kTextSecondary.copyWith(fontSize: 12);
