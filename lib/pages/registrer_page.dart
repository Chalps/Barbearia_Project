import 'package:barbearia_project/utils/colors.dart';
import 'package:barbearia_project/widgets/logar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _username;
  String? _email;
  String? _password;

  Future<void> _createUser() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email!, password: _password!);
        User? user = userCredential.user;
        user!.updateProfile(displayName: _username, photoURL: "https://filestore.community.support.microsoft.com/api/images/6061bd47-2818-4f2b-b04a-5a9ddb6f6467?upload=true");
        Get.toNamed("/login");
        print(userCredential);
      } on FirebaseAuthException catch (e) {
        print("Error: $e");
      } catch (e) {
        print("Error: $e");
      }
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
              "assets/images/register_photo.png",
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top:50.0),
                    child: Text.rich(
                      const TextSpan(
                        text: "Bem-Vindo\n ",
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
              ),
              Expanded(
                flex: 0,
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, bottom: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            style: TextStyle(color: kTextColor),
                            decoration: InputDecoration(
                              hintText: "Nome",
                              labelText: "Nome",
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
                              _username = value;
                            },
                            validator: (value) =>
                                value!.isEmpty ? 'Nome cannot be blank' : null,
                            onSaved: (value) => _username = value,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: kDefaultPadding)),
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
                                borderSide:
                                    const BorderSide(color: Colors.white38),
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
                            validator: (value) => value!.isEmpty
                                ? 'Password cannot be blank'
                                : null,
                            onSaved: (value) => _password = value,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: kDefaultPadding),
                          ),
                          LogarButton(
                            name: "Cadastrar",
                            onTap: () {
                              _createUser();
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
                                      text: 'Já possui um cadastro? ',
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
                                  'Login',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 14),
                                ),
                                onTap: () => Get.toNamed("/login"),
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
