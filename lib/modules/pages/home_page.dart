import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  UserModel? user;

  HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    "assets/images/item1.jpg",
    "assets/images/item2.jpg",
    "assets/images/item3.png",
    "assets/images/item4.jpg",
  ];

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Barber",
          style: GoogleFonts.lobster(
            fontSize: 26,
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
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true),
              items: imageList
                  .map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(
                            e,
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(30),
            child: Text.rich(
              TextSpan(
                text: "Sobre\n ",
                children: [
                  TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante orci, cursus eleifend mi ac, mattis lobortis sem. Vivamus a condimentum erat. Proin laoreet non quam vitae luctus. Sed mi risus, consectetur a ullamcorper id, consequat in ante. ',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 16,
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
          ),
          Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height * 0.103,
            color: kPrimaryColor,
            child: InkWell(
              child: Text(
                "Agendar",
                style: GoogleFonts.lobster(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onTap: () => Get.toNamed("/seleccion"),
            ),
          )
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        backgroundColor: kBackGroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 180,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
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
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ]),
                    ),
                    subtitle: Text(
                      "${widget.user!.email}",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(widget.user!.photoURL!))),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Início',
                  style: GoogleFonts.lobster(color: kTextColor, fontSize: 20),
                  textAlign: TextAlign.center),
              onTap: () {
                Get.toNamed("/home");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Agendamento',
                  style: GoogleFonts.lobster(color: kTextColor, fontSize: 20),
                  textAlign: TextAlign.center),
              onTap: () {
                Get.toNamed("/agendamento");
              },
            ),
            ListTile(
              title: Text('Atendimentos',
                  style: GoogleFonts.lobster(color: kTextColor, fontSize: 20),
                  textAlign: TextAlign.center),
              onTap: () {
                Get.toNamed("/atendimento");
              },
            ),
            ListTile(
              title: Text('Compartilhar',
                  style: GoogleFonts.lobster(color: kTextColor, fontSize: 20),
                  textAlign: TextAlign.center),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                googleSignIn.signOut();
                widget.user = null;
                FirebaseAuth.instance.authStateChanges().listen((User? user) {
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
                    borderRadius: BorderRadius.circular(20),
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
