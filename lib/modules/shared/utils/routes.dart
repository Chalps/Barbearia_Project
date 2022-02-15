import 'package:barbearia_project/model/user_model.dart';
import 'package:barbearia_project/modules/pages/agendamento_page.dart';
import 'package:barbearia_project/modules/pages/atendimento_page.dart';
import 'package:barbearia_project/modules/pages/home_page.dart';
import 'package:barbearia_project/modules/pages/login_page.dart';
import 'package:barbearia_project/modules/pages/main_page.dart';
import 'package:barbearia_project/modules/pages/register_page.dart';
import 'package:barbearia_project/modules/pages/selection_page.dart';
import 'package:barbearia_project/modules/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

UserModel? _user;

UserModel? get user => _user;

final routes = [
  GetPage(name: "/splash", page: () => SplashPage()),
  GetPage(name: "/home", page: () => HomePage()),
  GetPage(name: "/main", page: () => MainPage()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/register", page: () => RegisterPage()),
  GetPage(name: "/agendamento", page: () => AgendamentoPage()),
  GetPage(name: "/atendimento", page: () => AtendimentoPage()),
  GetPage(name: "/seleccion", page: () => SelectionPage()),
  // "/home": (context) =>
  //     HomePage(
  //       user: ModalRoute
  //           .of(context)!
  //           .settings
  //           .arguments as UserModel,
  //     ),
];