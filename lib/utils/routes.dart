import 'package:barbearia_project/screen/login_screen.dart';
import 'package:barbearia_project/screen/splash_screen.dart';

final routes = {
  "/splash": (context) => SplashScreen(),
  // "/home": (context) =>
  //     HomePage(
  //       user: ModalRoute
  //           .of(context)!
  //           .settings
  //           .arguments as UserModel,
  //     ),
  "/login": (context) => LoginScreen(),
};