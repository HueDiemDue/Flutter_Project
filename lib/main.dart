import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/screens/login_page.dart';
import 'package:flutter_project/screens/sign_up_page.dart';
import 'package:flutter_project/utils/url.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
        ));

    return MaterialApp(
      initialRoute: Urls.login,
      routes: {
        Urls.login: (context) => const LoginPage(),
        Urls.signUp: (context) => const SignUpPage(),
      },
    );
  }
}
