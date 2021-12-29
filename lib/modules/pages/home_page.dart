import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    final size = MediaQuery
        .of(context)
        .size;
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
                    (e) =>
                    ClipRRect(
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
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(30),
            child: Text.rich(
              TextSpan(
                text: "Sobre\n ",
                children: [
                  TextSpan(
                    text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante orci, cursus eleifend mi ac, mattis lobortis sem. Vivamus a condimentum erat. Proin laoreet non quam vitae luctus. Sed mi risus, consectetur a ullamcorper id, consequat in ante. ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kTextColor),
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
                style: GoogleFonts.playfairDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 170,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
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
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ]),
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
