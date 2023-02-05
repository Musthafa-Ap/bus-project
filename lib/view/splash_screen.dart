import 'package:bus_project/view/home_page/home_page.dart';
import 'package:bus_project/view/master_screen/master_screen.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    gotoNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFC153B),
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}

Future<void> gotoNextPage(context) async {
  await Future.delayed(const Duration(seconds: 2));
  isLoggedIn
      ? Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MasterScreen()))
      : Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
}
