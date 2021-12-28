import 'package:barbearia_project/pages/login_page.dart';
import 'package:barbearia_project/pages/sign_in_page.dart';
import 'package:barbearia_project/pages/splash_page.dart';

final routes = {
  "/splash": (context) => SplashPage(),
  // "/home": (context) =>
  //     HomePage(
  //       user: ModalRoute
  //           .of(context)!
  //           .settings
  //           .arguments as UserModel,
  //     ),
  "/signIn": (context) => SignInPage(),
  "/login": (context) => LoginPage(),
};