import 'package:flutter/material.dart';
import 'package:loginapi/login/view/login_screen.dart';
import 'package:loginapi/services/navigator_services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}
