import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:barbearia_project/modules/shared/widgets/logar_button.dart';
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
        user!.updatePhotoURL(
            "https://filestore.community.support.microsoft.com/api/images/6061bd47-2818-4f2b-b04a-5a9ddb6f6467?upload=true");
        user.updateDisplayName(_username);
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
                stops: const [0.6, 1],
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
              Text.rich(
                TextSpan(
                  text: "Cadastro\n ",
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
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
                          _username = value;
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'Nome n??o pode estar vazio' : null,
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
                            ? 'Email n??o pode estar vazio'
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
                            ? 'Password n??o pode estar vazio'
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
                                  text: 'J?? possui um cadastro? ',
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
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 14),
                            ),
                            onTap: () => Get.toNamed("/login"),
                          ),
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
