import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../shared/widgets/scrollable_page.dart';

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

  Future<void>? _launched;

  var url = 'https://www.instagram.com/thebarberperdizesbarbearia/';
  var urlface = 'https://m.facebook.com/thebarberperdizes/';

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  final controller = PageController();

  bool? signOutMethod() {
    try {
      FirebaseAuth.instance.signOut();
      googleSignIn.signOut();
      widget.user = null;
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {}
      });
      return true;
    } on Exception catch (e) {
      print("Error ao deslogar, erro: ${e}");
      return false;
    }
  }

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
      body: Stack(
        children: [
          Column(
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
              SizedBox(
                height: size.height * 0.45,
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ScrollablePage(
                      title: "Sobre",
                      texto:
                          "Um espaço desenvolvido para cavalheiros que prezam por manter um Visual Impecável. Seja qual for seu Corte preferido de Cabelo ou Barba, vamos ajuda-lo a encontrar a melhor forma de destacar o seu Estilo, valorizando sua presença e atitude. Restaurando o que há de melhor nos homens modernos a barbearia The Barber Perdizes também traz elegância e personalidadede uma forma tradicional.",
                    ),
                    ScrollablePage(
                      title: "Horários",
                      texto: "",
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: SwapEffect(
                    activeDotColor: kPrimaryColor,
                    dotColor: kSBackGroundColor,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: 65,
                color: kPrimaryColor,
                child: Text(
                  "Agendar",
                  style: GoogleFonts.lobster(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              onTap: () => Get.toNamed("/seleccion"),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        backgroundColor: kBackGroundColor,
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 180,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
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
                                  text: widget.user?.name,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              ]),
                        ),
                        subtitle: Text(
                          "${widget.user?.email}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.user?.photoURL == null
                                          ? ''
                                          : widget.user!.photoURL!))),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Início',
                      style: GoogleFonts.notoSerif(
                          color: kTextColor, fontSize: 20),
                      textAlign: TextAlign.center),
                  onTap: () {
                    Get.toNamed("/home");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Agendamento',
                      style: GoogleFonts.notoSerif(
                          color: kTextColor, fontSize: 20),
                      textAlign: TextAlign.center),
                  onTap: () {
                    Get.toNamed("/agendamento");
                  },
                ),
                ListTile(
                  title: Text('Atendimentos',
                      style: GoogleFonts.notoSerif(
                          color: kTextColor, fontSize: 20),
                      textAlign: TextAlign.center),
                  onTap: () {
                    Get.toNamed("/atendimento");
                  },
                ),
                ListTile(
                  title: Text('Compartilhar',
                      style: GoogleFonts.notoSerif(
                          color: kTextColor, fontSize: 20),
                      textAlign: TextAlign.center),
                  onTap: () {
                    SocialShare.shareOptions(
                        "Realize seu agendamento on-line no The Barber, Baixe o aplicativo https://static.salaovip.com.br/app/?ios=id1321095211&android=thebarber");
                    Navigator.pop(context);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset('assets/images/instagram_icon.png',
                          height: 25),
                      onTap: () => setState(() {
                        _launched = _launchInBrowser(url);
                      }),
                    ),
                    InkWell(
                      child: Image.asset('assets/images/facebook_icon.png',
                          height: 40),
                      onTap: () => setState(() {
                        _launched = _launchInBrowser(urlface);
                      }),
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  var response = await signOutMethod();
                  if (response == true) {
                    print('User is currently signed out!');
                    Get.offNamed("/main");
                  }
                },
                autofocus: true,
                child: Container(
                  // padding: const EdgeInsets.only(
                  //     right: 60.0, left: 60.0, bottom: 35.0),
                  margin: const EdgeInsets.only(
                      right: 60.0, left: 60.0, bottom: 35.0),
                  height: 56,
                  decoration: BoxDecoration(
                    color: kRedColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LogOut",
                        style: GoogleFonts.notoSerif(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kSBackGroundColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
