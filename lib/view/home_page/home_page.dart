import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:bus_project/view/intro_screen/login_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFC153B),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Spacer(),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: size.height * .34,
            ),
            CommonButton(
              title: "Get Started",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              backgroundColor: Colors.white,
              titleColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
