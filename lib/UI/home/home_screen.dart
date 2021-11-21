import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home_components/body.dart';
import 'home_components/custom_app_bar.dart';
import 'home_components/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Pin\'s Shop'),
      bottomNavigationBar: CustomNavBar(),
      body: Body(),
    );
  }
}
