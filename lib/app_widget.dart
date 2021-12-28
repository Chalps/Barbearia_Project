import 'package:barbearia_project/pages/splash_page.dart';
import 'package:barbearia_project/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'The Barber',
        theme: ThemeData(
            primarySwatch: myColour, primaryColor: kBackGroundColor),
        initialRoute: "/splash",
        debugShowCheckedModeBanner: false,
        routes: routes,
      home: SplashPage(),
    );
  }
}