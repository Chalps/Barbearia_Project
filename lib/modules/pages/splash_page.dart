import 'package:barbearia_project/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _SplashPageState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 500,
            child: Image.asset(
              'assets/images/the_barber_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          CircularProgressIndicator(color: kPrimaryColor),
        ],
      ),
    );
  }
}
