// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pin_shop/configs/theme.dart';

import 'UI/home/home_screen.dart';
import 'configs/app_router.dart';

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
