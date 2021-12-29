import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/modules/pages/agendamento_page.dart';
import 'package:barbearia_project/modules/pages/atendimento_page.dart';
import 'package:barbearia_project/modules/pages/home_page.dart';
import 'package:barbearia_project/modules/pages/login_page.dart';
import 'package:barbearia_project/modules/pages/main_page.dart';
import 'package:barbearia_project/modules/pages/registrer_page.dart';
import 'package:barbearia_project/modules/pages/splash_page.dart';
import 'package:flutter/material.dart';

final routes = {
  "/splash": (context) => SplashPage(),
  "/home": (context) =>
      HomePage(
        user: ModalRoute
            .of(context)!
            .settings
            .arguments as UserModel,
      ),
  "/main": (context) => MainPage(),
  "/login": (context) => LoginPage(),
  "/register": (context) => RegisterPage(),
  "/agendamento": (context) => AgendamentoPage(),
  "/atendimento": (context) => AtendimentoPage(),
};