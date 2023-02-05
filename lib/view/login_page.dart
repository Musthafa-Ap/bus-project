import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:bus_project/view/home_page/common_widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * .327,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/images/polygon.png",
                          ))),
                ),
                const Positioned(
                  bottom: 72,
                  left: 30,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Positioned(
                  bottom: 52,
                  left: 30,
                  child: Text(
                    "Manage your Bus and Drivers",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .0517,
                  ),
                  const CommonTextField(hintText: "Enter Username"),
                  SizedBox(
                    height: size.height * .0209,
                  ),
                  const CommonTextField(
                    hintText: "Enter Password",
                    isObscure: true,
                  ),
                  SizedBox(
                    height: size.height * .328,
                  ),
                  CommonButton(title: 'Login', onTap: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
