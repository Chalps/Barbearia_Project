
import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogarButton extends StatelessWidget {
  final dynamic onTap;
  final String name;

  const LogarButton({Key? key, required this.onTap, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.lobster(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: kBackGroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
