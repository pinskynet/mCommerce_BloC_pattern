// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'UI/home/home_screen.dart';
import 'configs/app_router.dart';
import 'configs/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Shop',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
