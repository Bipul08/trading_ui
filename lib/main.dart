import 'package:assigment_bdm/authentication_screen/registation_screen/registation_page.dart';
import 'package:assigment_bdm/view/home_screen.dart';
import 'package:assigment_bdm/view/investment_screen.dart';
import 'package:assigment_bdm/view/profile_screen.dart';
import 'package:assigment_bdm/view/splace_screen.dart';
import 'package:assigment_bdm/view/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication_screen/login/api_services.dart';
import 'authentication_screen/login/login_page.dart';
import 'authentication_screen/registation_screen/api_services.dart';
import 'controller/statistics_controller.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationService()),
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => StatisticsController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
      home: SplashScreen(),
    );
  }
}



