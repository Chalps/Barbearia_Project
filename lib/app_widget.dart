import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/shared/utils/colors.dart';
import 'modules/shared/utils/routes.dart';
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'The Barber',
        theme: ThemeData(
            primarySwatch: myColour, primaryColor: kPrimaryColor, canvasColor: kBackGroundColor),
        initialRoute: "/splash",
        debugShowCheckedModeBanner: false,
        getPages: routes,
      routes: homeRoute,
    );
  }
}