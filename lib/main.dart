import 'package:flutter/material.dart';
import 'package:loginapi/app/app.dart';
import 'package:loginapi/services/navigator_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NavigationService().setupLocator();
  runApp(const App());
}
