import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ScrollablePage extends StatelessWidget {
  final String title;
  final String texto;
  const ScrollablePage({Key? key, required this.title, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top:30, left: 30, right: 30),
      child: Text.rich(
        TextSpan(
          text: "${title}\n ",
          children: [
            TextSpan(
              text: '${texto}',
              style: GoogleFonts.robotoSlab(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kSTextColor),
            ),
          ],
          style: GoogleFonts.playfairDisplay(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: kTextColor,
          ),
        ),
        textAlign: TextAlign.center,
      ),
      height: 300,
      width: size.width,
      decoration: BoxDecoration(
        color: kSBackGroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
