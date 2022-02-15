import 'package:barbearia_project/controllers/login_controller.dart';
import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:barbearia_project/modules/shared/widgets/logar_button.dart';
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
        children: [
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
                stops: const [0.47, 0.8],
                colors: [
                  kBackGroundColor,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text.rich(
                    TextSpan(
                      text: "Bem-Vindo de Volta\n ",
                      children: [
                        TextSpan(
                          text: '#',
                          style: GoogleFonts.lobster(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        TextSpan(
                          text: 'TheBarber',
                          style: GoogleFonts.lobster(fontSize: 20),
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
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0),
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon:
                                Icon(Icons.email_rounded, color: kTextColor),
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) => value!.isEmpty
                              ? 'Email não pode estar vazio'
                              : null,
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white38),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon:
                                Icon(Icons.lock_rounded, color: kTextColor),
                          ),
                          onChanged: (value) {
                            _password = value;
                          },
                          validator: (value) => value!.isEmpty
                              ? 'Senha não pode estar vazio'
                              : null,
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
                                child: const Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 14),
                                ),
                                onTap: () => Get.toNamed("/register")),
                          ],
                        ),
                      ],
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
