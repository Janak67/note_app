import 'package:flutter/material.dart';
import 'package:note_app/screens/edit_screen.dart';
import 'package:note_app/screens/home_screen.dart';
import 'package:note_app/screens/splash_screen.dart';

Map<String, WidgetBuilder> screenRoutes = {
  '/': (context) => SplashScreen(),
  'home':(context) => HomeScreen(),
  'edit':(context) => EditScreen(),
};