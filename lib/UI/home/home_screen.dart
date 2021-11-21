import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_shop/export_files.dart';
import 'home_components/body.dart';

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
