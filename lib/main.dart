import 'package:bus_project/provider/login_provider.dart';
import 'package:bus_project/view/home_page/home_page.dart';
import 'package:bus_project/view/intro_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

bool isLoggedIn = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    checkLoggedInorNot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, primaryColor: const Color(0xffFC153B)),
      home: const SplashScreen(),
    );
  }

  void checkLoggedInorNot() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    bool? checkData = sharedPrefs.getBool("isLogged");
    if (checkData == null || checkData == false) {
      setState(() {
        isLoggedIn = false;
      });
    } else if (checkData == true) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }
}
