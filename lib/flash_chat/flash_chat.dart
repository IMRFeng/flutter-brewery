import 'package:appbrewery/flash_chat/screens/chat_screen.dart';
import 'package:appbrewery/flash_chat/screens/login_screen.dart';
import 'package:appbrewery/flash_chat/screens/registration_screen.dart';
import 'package:appbrewery/flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark().copyWith(
//        textTheme: TextTheme(
//          body1: TextStyle(color: Colors.black54),
//        ),
//      ),
      initialRoute: ScreenRoutes.welcome,
      routes: {
        ScreenRoutes.welcome: (context) => WelcomeScreen(),
        ScreenRoutes.login: (context) => LoginScreen(),
        ScreenRoutes.chat: (context) => ChatScreen(),
        ScreenRoutes.registration: (context) => RegistrationScreen(),
      },
    );
  }
}
