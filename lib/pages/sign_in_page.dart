import 'package:barbearia_project/utils/colors.dart';
import 'package:barbearia_project/widgets/logar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.5,
              child: Image.asset(
                "assets/images/sign_in.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.47, 0.8],
                  colors: [
                    kBackGroundColor,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top:100)),
                Text.rich(
                  const TextSpan(
                    text: "Bem-Vindo de Volta\n ",
                    children: [
                      TextSpan(
                        text: '#',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                      TextSpan(
                        text: 'TheBarber',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          labelStyle: TextStyle(color: kTextColor),
                          hintStyle: TextStyle(color: kTextColor),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white38),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon:
                              Icon(Icons.email_rounded, color: kTextColor),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: kDefaultPadding)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Senha",
                          labelText: "Senha",
                          hintStyle: TextStyle(color: kTextColor),
                          labelStyle: TextStyle(color: kTextColor),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white38),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon:
                              Icon(Icons.lock_rounded, color: kTextColor),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: kDefaultPadding),
                      ),
                      LogarButton(
                        onTap: () {
                          Get.toNamed("/signIn");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
