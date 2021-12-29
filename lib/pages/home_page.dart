import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {

  final UserModel? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Barber",
          style: GoogleFonts.playfairDisplay(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        elevation: 0,
        backgroundColor: kBackGroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
      ),
      body: Text("HomePage",style: GoogleFonts.playfairDisplay(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 170,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: ListTile(
                  title: Text.rich(
                    TextSpan(
                        text: "Olá, ",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 26, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: widget.user!.name,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ]),
                  ),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(widget.user!.photoURL!))),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Início',
                  style: TextStyle(color: kTextColor),
                  textAlign: TextAlign.center),
              onTap: () {
                Get.toNamed("/home");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Agendamento',
                  style: TextStyle(color: kTextColor),
                  textAlign: TextAlign.center),
              onTap: () {
                Get.toNamed("/agendamento");
              },
            ),
            ListTile(
              title: Text('Atendimentos',
                  style: TextStyle(color: kTextColor),
                  textAlign: TextAlign.center),
              onTap: () {
                Get.toNamed("/atendimento");
              },
            ),
            ListTile(
              title: Text('Compartilhar',
                  style: TextStyle(color: kTextColor),
                  textAlign: TextAlign.center),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  await googleSignIn.signOut();
                  FirebaseAuth.instance
                      .authStateChanges()
                      .listen((User? user) {
                    if (user == null) {
                      print('User is currently signed out!');
                      Get.toNamed("/main");
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 50.0, left: 50.0, top: size.height / 3),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LogOut",
                            style: GoogleFonts.playfairDisplay(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: kTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
