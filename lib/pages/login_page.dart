import 'package:barbearia_project/controllers/login_controller.dart';
import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/utils/colors.dart';
import 'package:barbearia_project/widgets/logar_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  final controller = LoginController();

  Future<void> _loginUser() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      controller.firebaseAuthSignIn(context, _email, _password);
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.55,
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
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
                          style: TextStyle(fontSize: 20),
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
                ),
              ),
              Expanded(
                flex: 0,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: TextStyle(color: kTextColor),
                          decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            labelStyle: TextStyle(color: kTextColor),
                            hintStyle: TextStyle(color: kTextColor),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon:
                                Icon(Icons.email_rounded, color: kTextColor),
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) =>
                              value!.isEmpty ? 'Email cannot be blank' : null,
                          onSaved: (value) => _email = value,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(bottom: kDefaultPadding)),
                        TextFormField(
                          style: TextStyle(color: kTextColor),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
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
                          onChanged: (value) {
                            _password = value;
                          },
                          validator: (value) =>
                              value!.isEmpty ? 'Password cannot be blank' : null,
                          onSaved: (value) => _password = value,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: kDefaultPadding),
                        ),
                        LogarButton(
                          name: "Login",
                          onTap: () {
                            _loginUser();
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: kDefaultPadding),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text.rich(
                              const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Não possui uma conta ainda? ',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.start,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: kTextColor,
                              ),
                            ),
                            InkWell(
                                child: const Text('Cadastre-se', style: TextStyle(color: kPrimaryColor, fontSize: 14),),
                                onTap: () => Get.toNamed("/register")
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
