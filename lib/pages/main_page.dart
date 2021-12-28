import 'package:barbearia_project/controllers/login_controller.dart';
import 'package:barbearia_project/utils/colors.dart';
import 'package:barbearia_project/widgets/google_login_button.dart';
import 'package:barbearia_project/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/images/chair_photo.jpg",
              height: size.height / 1.2,
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.3,
                  0.9
                ],
                colors: [
                  kBackGroundColor,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/images/logo_cut.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 530),
                child: Column(
                  children: [
                    SocialLoginButton(
                      onTap: () {
                        Get.toNamed("/signIn");
                      },
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: kDefaultPadding)),
                    GoogleLoginButton(
                      onTap: () {
                        controller.googleSignIn(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
