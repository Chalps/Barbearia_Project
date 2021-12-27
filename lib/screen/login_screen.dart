import 'package:barbearia_project/controllers/login_controller.dart';
import 'package:barbearia_project/utils/colors.dart';
import 'package:barbearia_project/widgets/google_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Stack(
        children: <Widget>[
          // Positioned(
          //   top: 100,
          //   left: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "assets/img/oceanLogo.png",
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 300, left: 50, right: 50),
                  child: Text.rich(
                    TextSpan(
                      text:
                      "Monitorando nossas água para um futuro melhor.\n ",
                      children: [
                        TextSpan(
                          text: '#',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kTextColor),
                        ),
                        const TextSpan(
                          text: 'team',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'seas',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: kTextColor),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                    ),
                  )),
              Padding(
                padding:
                const EdgeInsets.only(left: 40, right: 40, top: 160),
                child: SocialLoginButton(
                  onTap: () {
                    controller.googleSignIn(context);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}