import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/pages/agendamento_page.dart';
import 'package:barbearia_project/pages/atendimento_page.dart';
import 'package:barbearia_project/pages/home_page.dart';
import 'package:barbearia_project/pages/main_page.dart';
import 'package:barbearia_project/pages/login_page.dart';
import 'package:barbearia_project/pages/registrer_page.dart';
import 'package:barbearia_project/pages/splash_page.dart';
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